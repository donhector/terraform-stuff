output "tfstate_bucket" {
  description = "S3 bucket that stores the terraform state file"
  value       = aws_s3_bucket.tfstate.id
}

output "tfstate_table" {
  description = "DynamoDB table that locks the terraform state file"
  value       = aws_dynamodb_table.tfstate.id
}

output "tfstate_kms" {
  description = "KMS key used to encrypt the state bucket"
  value       = aws_kms_key.master.id
}

output "tfstate_kms_alias" {
  description = "KMS key alias"
  value       = aws_kms_alias.alias.name
}

// Map to add in your backend configuration
output "tfstate_backend_config_map" {
  value = {
    bucket         = local.tfstate_bucket
    region         = var.aws_region
    encrypt        = "true"
    kms_key_id     = aws_kms_key.master.key_id
    dynamodb_table = local.tfstate_table
  }
}

// Line to add in terraform cli to init backend
output "tfstate_backend_config_cli_string" {
  value = "-backend-config='bucket=${local.tfstate_bucket}' -backend-config='region=${var.aws_region}' -backend-config='encrypt=true' -backend-config='kms_key_id=${aws_kms_key.master.key_id}' -backend-config='dynamodb_table=${local.tfstate_table}'"
}
