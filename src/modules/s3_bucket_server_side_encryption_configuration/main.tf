resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket                = local.bucket
  expected_bucket_owner = try(var.settings.expected_bucket_owner, null)

  dynamic "rule" {
    for_each = try(var.settings.rules, {})
    content {
      bucket_key_enabled = try(rule.value.bucket_key_enabled, null)

      dynamic "apply_server_side_encryption_by_default" {
        for_each = try(rule.value.apply_server_side_encryption_by_default, null) != null ? [rule.value.apply_server_side_encryption_by_default] : []
        content {
          sse_algorithm     = apply_server_side_encryption_by_default.value.sse_algorithm
          kms_master_key_id = try(var.resources.kms_keys[apply_server_side_encryption_by_default.value.kms_master_key_ref].arn, try(apply_server_side_encryption_by_default.value.kms_master_key_id, null))
        }
      }
    }
  }
}
