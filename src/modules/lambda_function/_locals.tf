locals {
  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn,
    try(var.settings.role_arn, null)
  )

  log_group_name = try(
    var.resources.cloudwatch_log_groups[var.settings.log_group_ref].name,
    try(var.settings.logging_config.log_group, null)
  )

  file_system_arn = try(
    var.resources.efs_access_points[var.settings.file_system_ref].arn,
    try(var.settings.file_system_config.arn, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
