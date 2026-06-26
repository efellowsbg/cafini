locals {
  route_table_id = try(
    var.resources.route_tables[var.settings.route_table_ref].id,
    try(var.settings.route_table_id, null)
  )

  gateway_id = try(
    var.resources.internet_gateways[var.settings.gateway_ref].id,
    try(var.settings.gateway_id, null)
  )

  nat_gateway_id = try(
    var.resources.nat_gateways[var.settings.nat_gateway_ref].id,
    try(var.settings.nat_gateway_id, null)
  )

  vpc_endpoint_id = try(
    var.resources.vpc_endpoints[var.settings.vpc_endpoint_ref].id,
    try(var.settings.vpc_endpoint_id, null)
  )

  vpc_peering_connection_id = try(
    var.resources.vpc_peering_connections[var.settings.vpc_peering_connection_ref].id,
    try(var.settings.vpc_peering_connection_id, null)
  )
}
