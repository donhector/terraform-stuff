provider "aws" {
  profile = "default"
  region  = var.region
  # access_key = "blablah"
  # secret_key = "balbalalal"
}

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

resource "aws_instance" "ubuntu" {
  count = var.instance_count # meta argument first

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name  = var.instance_name
    Owner = "hmolina"
  }
}
