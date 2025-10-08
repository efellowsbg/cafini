locals {
  kms_key_arn = try(
    var.resources.kms_keys[var.settings.kms_key_ref].arn,
    try(var.settings.kms_key_arn, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
