locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    var.settings.vpc_id,
    null
  )

  tags = merge(
    var.global_settings.tags,
    {
      "Name" = try(var.settings.name, null)
    },
    try(var.settings.tags, {})
  )
}
