locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn, var.settings.role_arn
  )

  subnet_ids = try(
    [for ref in var.settings.subnet_refs :
      var.resources.vpcs[split("/", ref)[0]].subnets[split("/", ref)[1]].id
    ], var.settings.subnet_ids
  )

  security_group_ids = try(
    [for ref in try(var.settings.security_group_refs, []) :
      var.resources.security_groups[ref].id
    ], var.settings.security_group_ids
  )
}
