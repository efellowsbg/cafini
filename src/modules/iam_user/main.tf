resource "aws_iam_user" "main" {
  name                = var.settings.name
  path                = try(var.settings.path, null)
  permissions_boundary         = try(var.settings.permissions_boundary, null)
  force_destroy        = try(var.settings.force_destroy , null)
  tags                = local.tags
}