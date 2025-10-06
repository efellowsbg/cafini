locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    try(var.settings.vpc_id, null)
  )

  gateway_id = try(
    var.resources.internet_gateways[var.settings.gateway_ref].id,
    try(var.settings.gateway_id, null)
  )

  nat_gateway_id = try(
    var.resources.nat_gateways[var.settings.nat_gateway_ref].id,
    try(var.settings.nat_gateway_id, null)
  )

  carrier_gateway_id = try(
    var.resources.carrier_gateways[var.settings.carrier_gateway_ref].id,
    try(var.settings.carrier_gateway_id, null)
  )

  core_network_arn = try(
    var.resources.networkmanager_core_networks[var.settings.core_network_ref].arn,
    try(var.settings.core_network_arn, null)
  )

  egress_only_gateway_id = try(
    var.resources.egress_only_internet_gateways[var.settings.egress_only_gateway_ref].id,
    try(var.settings.egress_only_gateway_id, null)
  )

  local_gateway_id = try(
    var.resources.local_gateways[var.settings.local_gateway_ref].id,
    try(var.settings.local_gateway_id, null)
  )

  vpc_peering_connection_id = try(
    var.resources.vpc_peering_connections[var.settings.vpc_peering_connection_ref].id,
    try(var.settings.vpc_peering_connection_id, null)
  )

  ipv6_cidr_block = try(
    var.resources.vpc_ipv6_cidr_block_associations[var.settings.ipv6_cidr_block_ref].ipv6_cidr_block,
    try(var.settings.ipv6_cidr_block, null)
  )

  # Tags merge
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
