terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
    }
  }
  # required terraform version
  required_version = ">= 1.1.0"
}