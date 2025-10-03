locals {
  allocation_id = try(
    var.resources.eips[var.settings.allocation_ref].id,
    try(var.settings.allocation_id, null)
  )

  subnet_id = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id,
    try(
      var.resources.subnets[var.settings.subnet_ref].id,
      try(var.settings.subnet_id, null)
    )
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
