locals {
  route_table_id = try(
    var.resources.route_tables[var.settings.route_table_ref].id,
    try(var.settings.route_table_id, null)
  )

  subnet_id = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id,
    try(var.settings.subnet_id, null)
  )

  gateway_id = try(
    var.resources.internet_gateways[var.settings.gateway_ref].id,
    try(var.settings.gateway_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
