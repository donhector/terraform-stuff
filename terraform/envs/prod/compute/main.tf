module "instance" {

  source = "../../../modules/compute"
  #version = "1.0.0"

  instance_type      = var.instance_type
  instance_count     = var.instance_count
  keypair_public_key = var.public_key
  #ssh_ingress_cidr_blocks = var.ssh_ingress_cidr_blocks

}
