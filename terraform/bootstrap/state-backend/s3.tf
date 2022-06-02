### S3 Bucket setup
resource "aws_s3_bucket" "tfstate" {
  bucket        = local.tfstate_bucket
  force_destroy = true

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = { Name = local.tfstate_bucket }

}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_alias.alias.target_key_arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
