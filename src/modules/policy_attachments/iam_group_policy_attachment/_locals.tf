locals {
  group = try(
    var.resources.iam_groups[var.settings.group_ref].id,
    var.settings.group
  )

  policy_arn = try(
    var.resources.iam_policies[var.settings.policy_ref].arn,
    var.settings.policy_arn
  )
}
