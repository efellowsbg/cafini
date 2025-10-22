locals {
  s3_bucket_name = try(
    var.resources.s3_buckets[var.settings.s3_bucket_name_ref].name,
    var.settings.s3_bucket_name
  )

  cloud_watch_logs_role_arn = try(
    var.resources.iam_roles[var.settings.cloud_watch_logs_role_arn_ref].arn,
    try(var.settings.cloud_watch_logs_role_arn, null)
  )

  cloud_watch_logs_group_arn = try(
    var.resources.cloudwatch_log_groups[var.settings.cloudwatch_logs_group_ref].arn,
    try(var.settings.cloud_watch_logs_group_arn, null)
  )

  kms_key_id = try(
    var.resources.kms_keys[var.settings.kms_key_ref].arn,
    try(var.settings.kms_key_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
