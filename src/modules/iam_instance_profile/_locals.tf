locals {
  role = try(
    var.resources.iam_roles[var.settings.role_ref].name,
    try(var.settings.role, null)
  )
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
