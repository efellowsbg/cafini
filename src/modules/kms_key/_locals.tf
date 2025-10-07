locals {
  custom_key_store_id = try(
    var.resources.kms_custom_key_stores[var.settings.custom_key_store_ref].id,
    try(var.settings.custom_key_store_id, null)
  )
  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json,
    try(var.settings.policy, null)
  )
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
