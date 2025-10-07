resource "aws_kms_key" "main" {
  description                        = try(var.settings.description, null)
  key_usage                          = try(var.settings.key_usage, "ENCRYPT_DECRYPT")
  custom_key_store_id                = try(local.custom_key_store_id, null)
  customer_master_key_spec           = try(var.settings.customer_master_key_spec, "SYMMETRIC_DEFAULT")
  policy                             = try(local.policy, null)
  bypass_policy_lockout_safety_check = try(var.settings.bypass_policy_lockout_safety_check, false)
  deletion_window_in_days            = try(var.settings.deletion_window_in_days, 30)
  is_enabled                         = try(var.settings.is_enabled, true)
  enable_key_rotation                = try(var.settings.enable_key_rotation, false)
  rotation_period_in_days            = try(var.settings.rotation_period_in_days, null)
  multi_region                       = try(var.settings.multi_region, false)
  xks_key_id                         = try(var.settings.xks_key_id, null)
  region                             = try(var.settings.region, null)
  tags                               = local.tags
}
