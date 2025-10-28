locals {
  policy_arn = try(
    var.resources.iam_policies[var.settings.policy_ref].arn,
    var.settings.policy_arn
  )
  users = length(try(var.settings.user_refs, [])) > 0 ? [
    for user_ref in try(var.settings.user_refs, []) : try(
      var.resources.iam_users[user_ref].name,
      null
    )
  ] : try(var.settings.users, null)

  roles = length(try(var.settings.role_refs, [])) > 0 ? [
    for role_ref in try(var.settings.role_refs, []) : try(
      var.resources.iam_roles[role_ref].name,
      null
    )
  ] : try(var.settings.roles, null)

  groups = length(try(var.settings.group_refs, [])) > 0 ? [
    for group_ref in try(var.settings.group_refs, []) : try(
      var.resources.iam_groups[group_ref].name,
      null
    )
  ] : try(var.settings.groups, null)
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
