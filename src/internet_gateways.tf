module "internet_gateway" {
  source = "./modules/_networking/internet_gateway"
  for_each = var.internet_gateways
  settings  = each.value
  resources = local.global_settings
}