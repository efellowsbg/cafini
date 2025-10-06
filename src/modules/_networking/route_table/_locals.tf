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

  vpc_endpoint_id = try(
    var.resources.vpc_endpoints[var.settings.vpc_endpoint_ref].id,
    try(var.settings.vpc_endpoint_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
