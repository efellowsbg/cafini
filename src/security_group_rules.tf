module "security_group_rules" {
  source   = "./modules/security_group_rule"
  for_each = var.security_group_rules

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    security_groups = module.security_groups
  }
}
