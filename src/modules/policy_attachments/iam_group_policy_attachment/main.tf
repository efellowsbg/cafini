resource "aws_iam_group_policy_attachment" "main" {
  group      = local.group
  policy_arn = local.policy_arn
}
