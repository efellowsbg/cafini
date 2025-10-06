resource "aws_route_table" "main" {
  vpc_id           = local.vpc_id
  region           = try(var.settings.region, null)
  propagating_vgws = try(var.settings.propagating_vgws, null)
  tags             = local.tags

  dynamic "route" {
    for_each = can(var.settings.routes) ? var.settings.routes : []

    content {
      cidr_block                 = route.value.cidr_block
      ipv6_cidr_block            = try(route.value.ipv6_cidr_block, null)
      destination_prefix_list_id = try(route.value.destination_prefix_list_id, null)
      carrier_gateway_id         = try(route.value.carrier_gateway_id, null)
      core_network_arn           = try(route.value.core_network_arn, null)
      egress_only_gateway_id     = try(route.value.egress_only_gateway_id, null)
      gateway_id                 = try(local.gateway_id, null)
      local_gateway_id           = try(route.value.local_gateway_id, null)
      nat_gateway_id             = try(local.nat_gateway_id, null)
      network_interface_id       = try(route.value.network_interface_id, null)
      transit_gateway_id         = try(route.value.transit_gateway_id, null)
      vpc_endpoint_id            = try(route.vpc_endpoint_id, null)
      vpc_peering_connection_id  = try(route.value.vpc_peering_connection_id, null)
    }
  }
}
