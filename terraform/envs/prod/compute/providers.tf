terraform {

  # required terraform version
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16.0"
    }
  }

  # Our backend configuration is dynamic (ie: environment dependent), 
  # but Terraform does not allow using variables in the 'backend' block
  # therefore we specify use a partial configuration.
  # The actual configuration details will be captured in a '*.s3.tfbackend' file
  # and provided to terraform during 'init' (or 'apply'): terraform init -backend-config=config.s3.tfbackend
  backend "s3" {}

}

### AWS provider variables
provider "aws" {
  # profile = "default"
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  default_tags {
    tags = var.default_tags
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

## Consult remote state data. Usefule for sharing info across configurations
# data "terraform_remote_state" "state" {
#   backend = "s3"
#   config {
#     bucket         = local.tfstate_bucket
#     dynamodb_table = local.tfstate_table
#     region         = var.aws_region
#     key            = "${var.application}/${var.environment}"
#   }
# }
