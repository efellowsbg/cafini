resource "aws_iam_instance_profile" "main" {
  name        = var.settings.name
  name_prefix = try(var.settings.name_prefix, null)
  path        = try(var.settings.path, null)
  role        = try(var.settings.role, null)
  tags        = local.tags
}
