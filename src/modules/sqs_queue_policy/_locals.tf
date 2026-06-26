locals {
  queue_url = try(
    var.resources.sqs_queues[var.settings.queue_ref].id,
    try(var.settings.queue_url, null)
  )

  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json,
    try(var.settings.policy, null)
  )
}
