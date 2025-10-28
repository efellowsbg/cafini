resource "aws_iam_user_policy_attachment" "main" {
  user       = local.user
  policy_arn = local.policy_arn
}
