resource "aws_iam_role_policy" "main" {
  name        = try(var.settings.name, null)
  name_prefix = try(var.settings.name_prefix, null)
  role        = local.role
  policy      = local.policy
}
