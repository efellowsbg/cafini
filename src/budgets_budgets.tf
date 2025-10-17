module "budgets" {
  source   = "./modules/budgets_budget"
  for_each = var.budgets_budgets

  settings        = each.value
  global_settings = local.global_settings
  resources       = {}
}
