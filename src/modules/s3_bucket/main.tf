resource "aws_s3_bucket" "main" {
  bucket              = try(var.settings.bucket, null)
  bucket_prefix       = try(var.settings.bucket_prefix, null)
  force_destroy       = try(var.settings.force_destroy, false)
  object_lock_enabled = try(var.settings.object_lock_enabled, false)

  # Server-side encryption (optional)
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

  # Lifecycle rules (optional)
  dynamic "lifecycle_rule" {
    for_each = try(var.settings.lifecycle_rules, [])
    content {
      id      = try(lifecycle_rule.value.id, null)
      enabled = try(lifecycle_rule.value.enabled, true)

      dynamic "expiration" {
        for_each = try(lifecycle_rule.value.expiration, null) != null ? [lifecycle_rule.value.expiration] : []
        content {
          days = try(expiration.value.days, null)
        }
      }

      dynamic "transition" {
        for_each = try(lifecycle_rule.value.transition, null) != null ? [lifecycle_rule.value.transition] : []
        content {
          days          = try(transition.value.days, null)
          storage_class = try(transition.value.storage_class, null)
        }
      }
    }
  }
  tags = local.tags
}
