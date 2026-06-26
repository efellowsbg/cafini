module "iam_role_policies" {
  source   = "./modules/iam_role_policy"
  for_each = var.iam_role_policies

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    iam_roles = module.iam_roles
  }
}

module "iam_openid_connect_providers" {
  source   = "./modules/iam_openid_connect_provider"
  for_each = var.iam_openid_connect_providers

  settings        = each.value
  global_settings = local.global_settings
  resources       = {}
}
