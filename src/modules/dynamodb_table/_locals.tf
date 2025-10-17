locals {
  kms_key_arn = try(
    var.resources.kms_keys[var.settings.kms_key_ref].arn,
    try(var.settings.server_side_encryption.kms_key_arn, null)
  )

  tags = merge(
    try(var.global_settings.default_tags, {}),
    try(var.settings.tags, {})
  )
}
