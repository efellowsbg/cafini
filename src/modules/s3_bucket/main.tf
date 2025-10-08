resource "aws_s3_bucket" "main" {
  bucket              = try(var.settings.bucket, null)
  bucket_prefix       = try(var.settings.bucket_prefix, null)
  force_destroy       = try(var.settings.force_destroy, false)
  object_lock_enabled = try(var.settings.object_lock_enabled, false)

  dynamic "server_side_encryption_configuration" {
    for_each = try(var.settings.server_side_encryption_configuration, null) != null ? [var.settings.server_side_encryption_configuration] : []
    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = try(server_side_encryption_configuration.value.sse_algorithm, "AES256")
          kms_master_key_id = try(local.kms_key_arn, null)
        }
        bucket_key_enabled = try(server_side_encryption_configuration.value.bucket_key_enabled, false)
      }
    }
  }

  tags = local.tags
}
