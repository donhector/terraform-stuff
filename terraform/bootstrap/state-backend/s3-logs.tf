### S3 Logging bucket setup
resource "aws_s3_bucket" "logs" {
  bucket        = "${local.tfstate_bucket}-logs"
  force_destroy = true

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = { Name = "${local.tfstate_bucket}-logs" }

}

resource "aws_s3_bucket_acl" "logs" {
  bucket = aws_s3_bucket.logs.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "logs" {
  bucket = aws_s3_bucket.logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  bucket = aws_s3_bucket.logs.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_alias.alias.target_key_arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket                  = aws_s3_bucket.logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "logs" {
  bucket        = aws_s3_bucket.tfstate.id
  target_bucket = aws_s3_bucket.logs.id
  target_prefix = "log/"
}
