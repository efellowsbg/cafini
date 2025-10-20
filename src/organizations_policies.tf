module "organizations_policies" {
  source   = "./modules/organizations_policy"
  for_each = var.organizations_policies

  global_settings = local.global_settings
  settings        = each.value
  resources       = {}
}
