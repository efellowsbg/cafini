locals {
  allocation_id = try(
    var.resources.eips[var.settings.allocation_ref].id,
    try(var.settings.allocation_id, null)
  )

  subnet_id = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id,
    try(var.settings.subnet_id, null)
  )


  secondary_allocation_ids = (
    length(try(var.settings.secondary_allocation_refs, [])) > 0 ?
    [for ref in var.settings.secondary_allocation_refs : var.resources.eips[ref].id] :
    try(var.settings.secondary_allocation_ids, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
