resource "aws_iam_role" "main" {
  assume_role_policy                = var.settings.assume_role_policy
  description                       = try(var.settings.description, null)
  force_detach_policies             = try(var.settings.force_detach_policies, null)
  max_session_duration              = try(var.settings.max_session_duration, null)
  name                              = try(var.settings.name, null)
  name_prefix                       = try(var.settings.name_prefix, null)
  path                              = try(var.settings.path, null)
  permissions_boundary              = try(var.settings.permissions_boundary, null)
  tags                              = local.tags
}