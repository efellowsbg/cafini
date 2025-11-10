locals {
  subnet_ids = length(try(var.settings.vpc_settings.subnet_refs, [])) > 0 ? [
    for ref in var.settings.vpc_settings.subnet_refs :
    var.resources.vpcs[var.settings.vpc_settings.vpc_ref].subnets[ref].id
  ] : var.settings.vpc_settings.subnet_ids

  vpc_id = (
    var.settings.vpc_settings.vpc_ref != null
    ? var.resources.vpcs[var.settings.vpc_settings.vpc_ref].id
    : var.settings.vpc_settings.vpc_id
  )

  con_subnet_ids = length(try(var.settings.connect_settings.subnet_refs, [])) > 0 ? [
    for ref in var.settings.connect_settings.subnet_refs :
    var.resources.vpcs[var.settings.connect_settings.vpc_ref].subnets[ref].id
  ] : var.settings.connect_settings.subnet_ids

  con_vpc_id = (
    var.settings.connect_settings.vpc_ref != null
    ? var.resources.vpcs[var.settings.connect_settings.vpc_ref].id
    : var.settings.connect_settings.vpc_id
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
