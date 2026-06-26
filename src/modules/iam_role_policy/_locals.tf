locals {
  role = try(
    var.resources.iam_roles[var.settings.role_ref].name,
    try(var.settings.role, null)
  )

  policy = try(
    jsonencode(var.settings.policy),
    var.settings.policy_json
  )
}
