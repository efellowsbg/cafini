locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
  kms_key_id_exec = try(
    var.resources.kms_keys[var.settings.configuration.execute_command_configuration.kms_key_ref].arn,
    try(var.settings.configuration.execute_command_configuration.kms_key_id, null)
  )

  kms_key_id_storage = try(
    var.resources.kms_keys[var.settings.configuration.managed_storage_configuration.kms_key_ref].arn,
    try(var.settings.configuration.managed_storage_configuration.kms_key_id, null)
  )

  kms_key_id_fargate_ephemeral = try(
    var.resources.kms_keys[var.settings.configuration.managed_storage_configuration.fargate_ephemeral_storage_kms_key_ref].arn,
    try(var.settings.configuration.managed_storage_configuration.fargate_ephemeral_storage_kms_key_id, null)
  )

  cloudwatch_log_group_name = try(
    var.resources.cloudwatch_log_groups[var.settings.configuration.execute_command_configuration.log_configuration.cloudwatch_ref].name,
    try(var.settings.configuration.execute_command_configuration.log_configuration.cloud_watch_log_group_name, null)
  )

  s3_bucket_name = try(
    var.resources.s3_buckets[var.settings.configuration.execute_command_configuration.log_configuration.s3_bucket_ref].bucket,
    try(var.settings.configuration.execute_command_configuration.log_configuration.s3_bucket_name, null)
  )
}
