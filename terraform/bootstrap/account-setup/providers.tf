terraform {

  # required terraform version
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }

  backend "local" {}

}

### Provider configuration
provider "local" {}

provider "tls" {}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  # profile = "default"
  default_tags {
    tags = var.default_tags
  }
}


### AWS provider variables
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}
