resource "aws_iam_policy_attachment" "main" {
  name       = var.settings.name
  users      = local.users
  roles      = local.roles
  groups     = local.groups
  policy_arn = local.policy_arn
}
