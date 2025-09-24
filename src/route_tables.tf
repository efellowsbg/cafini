module aws_route_tables {
  source = "../../modules/_networking/vpc/route_table"
  for_each = var.route_tables

  settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}