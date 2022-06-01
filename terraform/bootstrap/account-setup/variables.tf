### Misc variables
variable "tags" {
  type        = map(any)
  description = "Tags used for the resources created by this configuration"
  default = {
    # key1 = value
    # key2 = value
  }
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
