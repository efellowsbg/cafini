module nat_gateways {
  source = "../../modules/_networking/vpc/nat_gateway"
  for_each = var.nat_gateways

  settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}