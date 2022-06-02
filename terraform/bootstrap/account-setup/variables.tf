### Misc variables
variable "default_tags" {
  description = "A mapping of tags to assign to resources created by this configuration"
  type        = map(string)
  default     = {}
}

### Account variables
variable "account_alias" {
  type        = string
  description = "Account alias to allow https://<account-alias>.signin.aws.amazon.com/console/"
}

### Group Variables
variable "admin_group_name" {
  description = "Name of the admin group."
  default     = "admins"
}

variable "readonly_group_name" {
  description = "Name of the read-only group."
  default     = "readonly"
}

### Keypair variables
variable "key_name" {
  description = "Key name that will be used when generating the key pair"
  type        = string
  default     = "bootstrap"
}

### Budget variables
variable "budget_alert_emails" {
  type        = list(string)
  description = "List of email to notify when cost limits are reached"
  default     = []
}
variable "monthly_limit_amount" {
  type        = string
  description = "Monthly spending limit."
}

variable "daily_limit_amount" {
  type        = string
  description = "Daily spending limit."
}
