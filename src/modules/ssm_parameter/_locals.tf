locals {
  key_id = try(
    var.resources.kms_keys[var.settings.kms_key_ref].arn,
    try(var.settings.key_id, null)
  )

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
