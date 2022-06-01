data "aws_caller_identity" "current" {}

module "enforce_mfa" {
  source                          = "terraform-module/enforce-mfa/aws"
  version                         = "0.12.6"
  policy_name                     = "managed-mfa-enforce"
  account_id                      = data.aws_caller_identity.current.id
  groups                          = [aws_iam_group.readonly_group.name, aws_iam_group.admin_group.name]
  manage_own_signing_certificates = true
  manage_own_ssh_public_keys      = true
  manage_own_git_credentials      = true
  manage_own_access_keys          = true
}
