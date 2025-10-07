locals {
  assume_role_policy = try(
    var.resources.iam_policies[var.settings.assume_role_policy_ref].json,
    try(var.settings.assume_role_policy, null)
  )
  permissions_boundary = try(
    var.resources.iam_policies[var.settings.permissions_boundary_ref].arn,
    try(var.settings.permissions_boundary, null)
  )
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
