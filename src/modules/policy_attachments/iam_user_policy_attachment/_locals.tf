locals {
  user = try(
    var.resources.iam_users[var.settings.user_ref].id,
    var.settings.user
  )

  policy_arn = try(
    var.resources.iam_policies[var.settings.policy_ref].arn,
    var.settings.policy_arn
  )
}
