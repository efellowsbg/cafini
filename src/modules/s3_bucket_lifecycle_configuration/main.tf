resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = local.bucket_name

  dynamic "rule" {
    for_each = try(var.settings.rules, [])
    content {
      id     = try(each.value.id, null)
      status = try(each.value.status, "Enabled")

      dynamic "filter" {
        for_each = try({ "config" = each.value.filter }, {})
        content {
          prefix                   = try(each.value.prefix, null)
          object_size_greater_than = try(each.value.object_size_greater_than, null)
          object_size_less_than    = try(each.value.object_size_less_than, null)

          dynamic "tag" {
            for_each = try({ "config" = each.value.tag }, {})
            content {
              key   = try(each.value.key, null)
              value = try(each.value.value, null)
            }
          }

          dynamic "and" {
            for_each = try({ "config" = each.value.and }, {})
            content {
              prefix                   = try(each.value.prefix, null)
              object_size_greater_than = try(each.value.object_size_greater_than, null)
              object_size_less_than    = try(each.value.object_size_less_than, null)
              tags                     = try(each.value.tags, null)
            }
          }
        }
      }

      dynamic "expiration" {
        for_each = try({ "config" = each.value.expiration }, {})
        content {
          date                         = try(each.value.date, null)
          days                         = try(each.value.days, null)
          expired_object_delete_marker = try(each.value.expired_object_delete_marker, null)
        }
      }

      dynamic "abort_incomplete_multipart_upload" {
        for_each = try({ "config" = each.value.abort_incomplete_multipart_upload }, {})
        content {
          days_after_initiation = try(each.value.days_after_initiation, null)
        }
      }

      dynamic "transition" {
        for_each = try({ "config" = each.value.transition }, {})
        content {
          date          = try(each.value.date, null)
          days          = try(each.value.days, null)
          storage_class = try(each.value.storage_class, null)
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = try({ "config" = each.value.noncurrent_version_transition }, {})
        content {
          noncurrent_days           = try(each.value.noncurrent_days, null)
          newer_noncurrent_versions = try(each.value.newer_noncurrent_versions, null)
          storage_class             = try(each.value.storage_class, null)
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = try({ "config" = each.value.noncurrent_version_expiration }, {})
        content {
          noncurrent_days           = try(each.value.noncurrent_days, null)
          newer_noncurrent_versions = try(each.value.newer_noncurrent_versions, null)
        }
      }
    }
  }
  transition_default_minimum_object_size = try(var.settings.transition_default_minimum_object_size, null)
  expected_bucket_owner                  = try(var.settings.expected_bucket_owner, null)
}
