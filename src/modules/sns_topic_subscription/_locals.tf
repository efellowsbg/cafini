locals {
  topic_arn = try(
    var.resources.sns_topics[var.settings.topic_ref].arn,
    try(var.settings.topic_arn, null)
  )

  endpoint = try(
    var.resources.sqs_queues[var.settings.endpoint_queue_ref].arn,
    try(var.settings.endpoint, null)
  )

  redrive_policy = try(var.settings.redrive_policy.dead_letter_queue_ref, null) != null ? jsonencode(merge(
    { for key, value in var.settings.redrive_policy : key => value if key != "dead_letter_queue_ref" },
    { deadLetterTargetArn = var.resources.sqs_queues[var.settings.redrive_policy.dead_letter_queue_ref].arn }
  )) : try(var.settings.redrive_policy, null)

  subscription_role_arn = try(
    var.resources.iam_roles[var.settings.subscription_role_ref].arn,
    try(var.settings.subscription_role_arn, null)
  )
}
