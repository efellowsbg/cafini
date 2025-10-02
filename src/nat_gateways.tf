module "nat_gateway" {
  source   = "./modules/_networking/nat_gateway"

  # Create one NAT Gateway per entry in the map
  for_each = var.nat_gateways

  settings  = each.value
  global_settings = local.global_settings
  resources = {}
}
