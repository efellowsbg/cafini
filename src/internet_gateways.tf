module "internet_gateways" {
  source   = "./modules/_networking/internet_gateway"
  for_each = var.internet_gateways

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    vpcs = module.vpcs
  }
}
