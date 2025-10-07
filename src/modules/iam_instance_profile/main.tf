resource "aws_iam_instance_profile" "main" {
  name        = try(var.settings.name, null)
  name_prefix = try(var.settings.name_prefix, null)
  path        = try(var.settings.path, null)
  role        = try(local.role, null)
  tags        = local.tags
}
