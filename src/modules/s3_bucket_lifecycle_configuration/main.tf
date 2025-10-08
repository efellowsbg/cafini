resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = local.bucket_name

  dynamic "rule" {
    for_each = try(var.settings.rules, {})
    content {
      id     = try(rule.value.id, null)
      status = try(rule.value.status, "Enabled")

      dynamic "filter" {
        for_each = try(rule.value.filter, {})
        content {
          prefix                   = try(filter.value.prefix, null)
          object_size_greater_than = try(filter.value.object_size_greater_than, null)
          object_size_less_than    = try(filter.value.object_size_less_than, null)

          dynamic "tag" {
            for_each = try(filter.value.tag, {})
            content {
              key   = try(tag.value.key, null)
              value = try(tag.value.value, null)
            }
          }

          dynamic "and" {
            for_each = try(filter.value.and, {})
            content {
              prefix                   = try(and.value.prefix, null)
              object_size_greater_than = try(and.value.object_size_greater_than, null)
              object_size_less_than    = try(and.value.object_size_less_than, null)
              tags                     = try(and.value.tags, null)
            }
          }
        }
      }

      dynamic "expiration" {
        for_each = try(rule.value.expiration, {})
        content {
          date                         = try(expiration.value.date, null)
          days                         = try(expiration.value.days, null)
          expired_object_delete_marker = try(expiration.value.expired_object_delete_marker, null)
        }
      }

      dynamic "abort_incomplete_multipart_upload" {
        for_each = try(rule.value.abort_incomplete_multipart_upload, {})
        content {
          days_after_initiation = try(abort_incomplete_multipart_upload.value.days_after_initiation, null)
        }
      }

      dynamic "transition" {
        for_each = try(rule.value.transition, {})
        content {
          date          = try(transition.value.date, null)
          days          = try(transition.value.days, null)
          storage_class = try(transition.value.storage_class, null)
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = try(rule.value.noncurrent_version_transition, {})
        content {
          noncurrent_days           = try(noncurrent_version_transition.value.noncurrent_days, null)
          newer_noncurrent_versions = try(noncurrent_version_transition.value.newer_noncurrent_versions, null)
          storage_class             = try(noncurrent_version_transition.value.storage_class, null)
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = try(rule.value.noncurrent_version_expiration, {})
        content {
          noncurrent_days           = try(noncurrent_version_expiration.value.noncurrent_days, null)
          newer_noncurrent_versions = try(noncurrent_version_expiration.value.newer_noncurrent_versions, null)
        }
      }
    }
  }

  transition_default_minimum_object_size = try(var.settings.transition_default_minimum_object_size, null)
  expected_bucket_owner                  = try(var.settings.expected_bucket_owner, null)
}
