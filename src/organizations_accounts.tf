module "organizations_accounts" {
  source   = "./modules/organizations_account"
  for_each = var.organizations_accounts

  global_settings = local.global_settings
  settings        = each.value

  resources = {}
}
