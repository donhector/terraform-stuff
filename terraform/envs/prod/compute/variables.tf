### Compute module inputs
variable "instance_type" {
  description = "Type of EC2 instance to provision"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Number of EC2 intances to create"
  type        = number
  nullable    = false
  default     = 1
  validation {
    condition     = var.instance_count >= 1
    error_message = "Instance count must be 1 or greater."
  }
}

variable "public_key" {
  description = "SSH public key to inject in the instance"
  type        = string
  default     = ""
}

# variable "ssh_ingress_cidr_blocks" {
#   description = "Allow SSH from these CIDR blocks"
#   type        = set(string)
#   default     = []
# }

variable "default_tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
