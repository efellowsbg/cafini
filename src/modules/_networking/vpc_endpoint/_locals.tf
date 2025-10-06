locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    try(var.settings.vpc_id, null)
  )

  subnet_ids = length(try(var.settings.subnet_refs, [])) > 0 ? [
    for subnet_ref in var.settings.subnet_refs : try(
      var.resources.vpcs[split("/", subnet_ref)[0]].subnets[split("/", subnet_ref)[1]].id,
      null
    )
  ] : try(var.settings.subnet_ids, null)


  route_table_ids = length(try(var.settings.route_table_refs, [])) > 0 ? [
    for rt_ref in try(var.settings.route_table_refs, []) : try(
      var.resources.vpcs[split("/", rt_ref)[0]].route_tables[split("/", rt_ref)[1]].id,
      null
    )
  ] : try(var.settings.route_table_ids, null)

  security_group_ids = length(try(var.settings.security_group_refs, [])) > 0 ? [
    for sg_ref in try(var.settings.security_group_refs, []) : try(
      var.resources.security_groups[sg_ref].id,
      null
    )
  ] : try(var.settings.security_group_ids, null)

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
