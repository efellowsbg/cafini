locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    try(var.settings.vpc_id, null)
  )

  security_group_ids = length(try(var.settings.security_group_refs, [])) > 0 ? [
    for ref in var.settings.security_group_refs : var.resources.security_groups[ref].id
  ] : try(var.settings.security_group_ids, null)

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
