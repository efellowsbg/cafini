locals {
  kms_master_key_id = try(
    var.resources.kms_keys[var.settings.kms_master_key_ref].arn,
    try(var.settings.kms_master_key_id, null)
  )

  redrive_policy = can(var.settings.redrive_policy.maxReceiveCount) ? jsonencode(var.settings.redrive_policy) : try(var.settings.redrive_policy, null)

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
