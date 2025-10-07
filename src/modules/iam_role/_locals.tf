locals {
  assume_role_policy = try(
    var.settings.assume_role_policy,
    data.aws_iam_policy_document.assume_role[0].json
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
