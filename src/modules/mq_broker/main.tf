resource "aws_mq_broker" "main" {
  broker_name                = var.settings.broker_name
  engine_type                = var.settings.engine_type
  engine_version             = var.settings.engine_version
  host_instance_type         = var.settings.host_instance_type
  deployment_mode            = try(var.settings.deployment_mode, null)
  publicly_accessible        = try(var.settings.publicly_accessible, null)
  subnet_ids                 = local.subnet_ids
  security_groups            = local.security_groups
  apply_immediately          = try(var.settings.apply_immediately, null)
  auto_minor_version_upgrade = try(var.settings.auto_minor_version_upgrade, null)
  authentication_strategy    = try(var.settings.authentication_strategy, null)
  storage_type               = try(var.settings.storage_type, null)

  dynamic "configuration" {
    for_each = try(var.settings.configuration, null) != null ? [var.settings.configuration] : []
    content {
      id       = configuration.value.id
      revision = configuration.value.revision
    }
  }

  dynamic "encryption_options" {
    for_each = try(var.settings.encryption_options, null) != null ? [var.settings.encryption_options] : []
    content {
      kms_key_id        = try(var.resources.kms_keys[encryption_options.value.kms_key_ref].arn, try(encryption_options.value.kms_key_id, null))
      use_aws_owned_key = try(encryption_options.value.use_aws_owned_key, null)
    }
  }

  dynamic "logs" {
    for_each = try(var.settings.logs, null) != null ? [var.settings.logs] : []
    content {
      audit   = try(logs.value.audit, null)
      general = try(logs.value.general, null)
    }
  }

  dynamic "user" {
    for_each = try(var.settings.users, {})
    content {
      username       = user.value.username
      password       = user.value.password
      console_access = try(user.value.console_access, null)
      groups         = try(user.value.groups, null)
    }
  }

  tags = local.tags
}
