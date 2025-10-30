locals {
  role = try(
    var.resources.iam_roles[var.settings.role_ref].name,
    var.settings.role
  )

  policy_arn = try(
    var.resources.iam_policies[var.settings.policy_ref].arn,
    var.settings.policy_arn
  )
}
