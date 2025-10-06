locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    try(var.settings.vpc_id, null)
  )

  subnet_ids = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id,
    try(var.settings.subnet_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
