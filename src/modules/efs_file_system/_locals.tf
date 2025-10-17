locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  kms_key_id = try(
    var.resources.kms_keys[var.settings.kms_key_ref].id,
    try(var.settings.kms_key_id, null)
  )
}
