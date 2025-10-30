resource "aws_iam_role_policy_attachment" "main" {
  role       = local.role
  policy_arn = local.policy_arn
}
