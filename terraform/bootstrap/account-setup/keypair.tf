resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "1.0.1"

  key_name   = var.key_name
  public_key = tls_private_key.pk.public_key_openssh

  tags = {
    Name = var.key_name
  }
}

# Drop a copy of the generated private key into the current directory 
resource "local_file" "private_key" {
  content         = tls_private_key.pk.private_key_pem
  filename        = "${module.key_pair.key_pair_key_name}.pem"
  file_permission = "0600"
}

# Drop a copy of the generated public key in the current directory
resource "local_file" "public_key" {
  content         = tls_private_key.pk.public_key_openssh
  filename        = "${module.key_pair.key_pair_key_name}.pub"
  file_permission = "0644"
}
