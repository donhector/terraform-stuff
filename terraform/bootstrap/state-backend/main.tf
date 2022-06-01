### Generate unique state bucket and table names
data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}

locals {
  account_id     = data.aws_caller_identity.current.account_id
  account_alias  = data.aws_iam_account_alias.current.account_alias
  tfstate_bucket = format("%s-tfstate-files", local.account_alias != "" ? local.account_alias : local.account_id)
  tfstate_table  = format("%s-tfstate-lock", local.account_alias != "" ? local.account_alias : local.account_id)
}
