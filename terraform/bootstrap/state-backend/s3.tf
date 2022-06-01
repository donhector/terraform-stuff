### S3 Bucket setup
resource "aws_s3_bucket" "tfstate" {
  bucket        = local.tfstate_bucket
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  # lifecycle {
  #   prevent_destroy = true
  # }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_alias.alias.target_key_arn
        sse_algorithm     = "aws:kms"
      }
      bucket_key_enabled = true
    }
  }

  tags = { Name = local.tfstate_bucket }

}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
