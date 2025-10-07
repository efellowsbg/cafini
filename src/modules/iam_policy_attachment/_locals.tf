locals {
  policy_arn = try(
    var.resources.iam_policies[var.settings.policy_ref].arn,
    try(var.settings.policy_arn, null)
  )
  users = try(
    [for user_ref in try(var.settings.user_refs, []) :
      var.resources.iam_users[user_ref].name
    ],
    try(var.settings.users, [])
  )
  roles = try(
    [for role_ref in try(var.settings.role_refs, []) :
      var.resources.iam_roles[role_ref].name
    ],
    try(var.settings.roles, [])
  )
  groups = try(
    [for group_ref in try(var.settings.group_refs, []) :
      var.resources.iam_groups[group_ref].name
    ],
    try(var.settings.groups, [])
  )
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
