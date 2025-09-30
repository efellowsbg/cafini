resource "aws_iam_policy" "main" {
  policy      = jsonencode(var.settings.policy)
  name        = try(var.settings.name, null)
  description = try(var.settings.description, null)
  name_prefix = try(var.settings.name_prefix, null)
  path        = try(var.settings.path, null)
  tags        = local.tags
}
