module "internet_gateways" {
  source = "../../modules/internet_gateway"
  for_each = var.internet_gateways

  settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}