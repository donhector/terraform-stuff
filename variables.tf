variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

variable "instance_count" {
  type        = number
  description = "Number of intances to create"
  default     = 1
  validation {
    condition     = var.instance_count >= 1
    error_message = "Instance count must be 1 or greater."


  }

}
