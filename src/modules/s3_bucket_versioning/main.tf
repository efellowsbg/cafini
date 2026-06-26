resource "aws_s3_bucket_versioning" "main" {
  bucket                = local.bucket
  expected_bucket_owner = try(var.settings.expected_bucket_owner, null)
  mfa                   = try(var.settings.mfa, null)

  versioning_configuration {
    status     = var.settings.versioning_configuration.status
    mfa_delete = try(var.settings.versioning_configuration.mfa_delete, null)
  }
}
