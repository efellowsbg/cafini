locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn, var.settings.role_arn
  )

  subnet_ids = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id
  )

  security_group_ids = try(
    [for ref in try(var.settings.security_group_refs, []) :
      var.resources.security_groups[ref].id
    ], var.settings.security_group_ids
  )
}
