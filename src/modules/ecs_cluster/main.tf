resource "aws_ecs_cluster" "main" {
  name   = var.settings.name
  region = try(var.settings.region, null)
  tags   = local.tags

  dynamic "configuration" {
    for_each = can(var.settings.configuration) ? [1] : []
    content {

      dynamic "execute_command_configuration" {
        for_each = can(var.settings.configuration.execute_command_configuration) ? [1] : []
        content {
          kms_key_id = local.kms_key_id_exec
          logging    = try(var.settings.configuration.execute_command_configuration.logging, null)

          dynamic "log_configuration" {
            for_each = can(var.settings.configuration.execute_command_configuration.log_configuration) ? [1] : []
            content {
              cloud_watch_encryption_enabled = try(
                var.settings.configuration.execute_command_configuration.log_configuration.cloud_watch_encryption_enabled,
                null
              )
              cloud_watch_log_group_name = local.cloudwatch_log_group_name
              s3_bucket_name             = local.s3_bucket_name
              s3_bucket_encryption_enabled = try(
                var.settings.configuration.execute_command_configuration.log_configuration.s3_bucket_encryption_enabled,
                null
              )
              s3_key_prefix = try(
                var.settings.configuration.execute_command_configuration.log_configuration.s3_key_prefix,
                null
              )
            }
          }
        }
      }

      dynamic "managed_storage_configuration" {
        for_each = can(var.settings.configuration.managed_storage_configuration) ? [1] : []
        content {
          kms_key_id                           = local.kms_key_id_storage
          fargate_ephemeral_storage_kms_key_id = local.kms_key_id_fargate_ephemeral
        }
      }
    }
  }

  dynamic "service_connect_defaults" {
    for_each = can(var.settings.service_connect_defaults) ? [1] : []
    content {
      namespace = try(var.settings.service_connect_defaults.namespace, null)
    }
  }

  dynamic "setting" {
    for_each = try(var.settings.setting, {})
    content {
      name  = setting.value.name
      value = setting.value.value
    }
  }
}
