locals {
  role_arn = try(
    var.resources.iam_roles[var.settings.role_arn_ref].arn,
    var.settings.role_arn
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
