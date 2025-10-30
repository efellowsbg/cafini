resource "aws_iam_policy_attachment" "main" {
  name       = var.settings.name
  users      = try(local.users, null)
  roles      = try(local.roles, null)
  groups     = try(local.groups, null)
  policy_arn = local.policy_arn
}
