resource "aws_route" "main" {
  route_table_id              = local.route_table_id
  destination_cidr_block      = try(var.settings.destination_cidr_block, null)
  destination_ipv6_cidr_block = try(var.settings.destination_ipv6_cidr_block, null)
  destination_prefix_list_id  = try(var.settings.destination_prefix_list_id, null)
  carrier_gateway_id          = try(var.settings.carrier_gateway_id, null)
  core_network_arn            = try(var.settings.core_network_arn, null)
  egress_only_gateway_id      = try(var.settings.egress_only_gateway_id, null)
  gateway_id                  = local.gateway_id
  local_gateway_id            = try(var.settings.local_gateway_id, null)
  nat_gateway_id              = local.nat_gateway_id
  network_interface_id        = try(var.settings.network_interface_id, null)
  transit_gateway_id          = try(var.settings.transit_gateway_id, null)
  vpc_endpoint_id             = local.vpc_endpoint_id
  vpc_peering_connection_id   = local.vpc_peering_connection_id
}
