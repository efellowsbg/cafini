locals {
  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json,
    try(var.settings.policy, null)
  )
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
