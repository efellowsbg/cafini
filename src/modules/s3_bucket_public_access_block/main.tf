resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = local.bucket
  block_public_acls       = try(var.settings.block_public_acls, null)
  block_public_policy     = try(var.settings.block_public_policy, null)
  ignore_public_acls      = try(var.settings.ignore_public_acls, null)
  restrict_public_buckets = try(var.settings.restrict_public_buckets, null)
}
