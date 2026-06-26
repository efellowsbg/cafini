locals {
  arn = try(
    var.resources.sns_topics[var.settings.topic_ref].arn,
    try(var.settings.arn, try(var.settings.topic_arn, null))
  )

  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json,
    try(var.settings.policy, null)
  )
}
