resource "aws_iam_instance_profile" "main" {
  # TODO: Add doublecheck for missing arguments, reference to resources and dynamic blocks
  name        = try(var.settings.name, null)
  name_prefix = try(var.settings.name_prefix, null)
  path        = try(var.settings.path, null)
  role        = try(var.settings.role, null)
  tags        = local.tags
}
