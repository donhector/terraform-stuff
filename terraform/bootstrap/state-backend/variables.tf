### Resource variables
variable "default_tags" {
  description = "A mapping of tags to assign to resources created by this configuration"
  type        = map(string)
  default     = {}
}

variable "dynamodb_read_capacity" {
  description = "DynamoDB read capacity"
  type        = number
  default     = 1
}

variable "dynamodb_write_capacity" {
  description = "DynamoDB write capacity"
  type        = number
  default     = 1
}

variable "kms_key_name" {
  type        = string
  description = "KMS key name to create"
  default     = "master"
}
