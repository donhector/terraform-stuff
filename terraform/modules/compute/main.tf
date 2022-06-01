data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "azs" {}

resource "aws_instance" "ubuntu" {

  count = var.instance_count

  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.ec2.key_name
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  #vpc_security_group_ids = [aws_security_group.ssh_allow.id]

  # NOTE: 'element' wraps around when index is greater than the elements in the list (ie: like indexing by modulo)

  tags = { Name = "ubuntu-${count.index}" }
}

resource "aws_key_pair" "ec2" {
  key_name   = var.keypair_name
  public_key = var.keypair_public_key

  tags = { Name = var.keypair_name }
}

# resource "aws_security_group" "ssh_allow" {
#   name        = "ssh-allow"
#   description = "SSH allow ingress"

#   ingress {
#     from_port   = 22
#     protocol    = "TCP"
#     to_port     = 22
#     cidr_blocks = var.ssh_ingress_cidr_blocks
#   }

#   egress {
#     from_port   = 0
#     protocol    = "-1"
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = { Name = "ssh_allow" }
# }

