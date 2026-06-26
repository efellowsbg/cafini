resource "aws_sqs_queue_policy" "main" {
  queue_url = local.queue_url
  policy    = local.policy
}
