locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn,
    try(var.settings.role_arn, null)
  )

  subnet_ids = try(
    [for ref in var.settings.subnet_refs : var.resources.subnets[ref].id],
    try(var.settings.subnet_ids, null)
  )

  security_group_ids = try(
    [for ref in try(var.settings.security_group_refs, []) :
      var.resources.security_groups[ref].id
    ],
    try(var.settings.security_group_ids, null)
  )
}
