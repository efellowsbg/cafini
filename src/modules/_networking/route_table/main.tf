resource "aws_route_table" "main" {
# TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  vpc_id             = var.settings.vpc_id
  region             = try(var.settings.region, null)
  propagating_vgws   = try(var.settings.propagating_vgws, null)
  tags = local.tags

  # Inline routes (optional)
  dynamic "route" {
    for_each = try(var.settings.routes, [])
    content {
      cidr_block                = try(route.value.cidr_block, null)
      ipv6_cidr_block           = try(route.value.ipv6_cidr_block, null)
      destination_prefix_list_id = try(route.value.destination_prefix_list_id, null)

      carrier_gateway_id        = try(route.value.carrier_gateway_id, null)
      core_network_arn          = try(route.value.core_network_arn, null)
      egress_only_gateway_id    = try(route.value.egress_only_gateway_id, null)
      gateway_id                = try(route.value.gateway_id, null)
      local_gateway_id          = try(route.value.local_gateway_id, null)
      nat_gateway_id            = try(route.value.nat_gateway_id, null)
      network_interface_id      = try(route.value.network_interface_id, null)
      transit_gateway_id        = try(route.value.transit_gateway_id, null)
      vpc_endpoint_id           = try(route.value.vpc_endpoint_id, null)
      vpc_peering_connection_id = try(route.value.vpc_peering_connection_id, null)
    }
  }
}