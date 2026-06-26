resource "aws_sns_topic_policy" "main" {
  arn    = local.arn
  policy = local.policy
}
