### KMS key setup
resource "aws_kms_key" "master" {
  description             = "KMS key used to encrypt resources in the account"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = { Name = var.kms_key_name }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.kms_key_name}"
  target_key_id = aws_kms_key.master.key_id
}
