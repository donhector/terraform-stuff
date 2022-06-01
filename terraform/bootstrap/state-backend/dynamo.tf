### DynamoDB Table setup
resource "aws_dynamodb_table" "tfstate" {
  name           = local.tfstate_table
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.master.arn
  }

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = { Name = local.tfstate_table }
}
