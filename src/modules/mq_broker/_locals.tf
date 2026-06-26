locals {
  subnet_ids = length(try(var.settings.subnet_refs, [])) > 0 ? [
    for ref in var.settings.subnet_refs : var.resources.vpcs[split("/", ref)[0]].subnets[split("/", ref)[1]].id
  ] : try(var.settings.subnet_ids, null)

  security_groups = length(try(var.settings.security_group_refs, [])) > 0 ? [
    for ref in var.settings.security_group_refs : var.resources.security_groups[ref].id
  ] : try(var.settings.security_groups, null)

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
