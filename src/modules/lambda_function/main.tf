resource "aws_lambda_function" "main" {
  function_name = var.settings.function_name
  role          = local.role_arn
  handler       = try(var.settings.handler, "index.handler")
  runtime       = try(var.settings.runtime, "python3.13")

  filename          = try(var.settings.filename, null)
  s3_bucket         = try(local.s3_bucket, null)
  s3_key            = try(var.settings.s3_key, null)
  s3_object_version = try(var.settings.s3_object_version, null)
  image_uri         = try(var.settings.image_uri, null)

  source_code_hash        = try(var.settings.source_code_hash, null)
  code_signing_config_arn = try(var.settings.code_signing_config_arn, null)
  package_type            = try(var.settings.package_type, "Zip")

  description                    = try(var.settings.description, null)
  memory_size                    = try(var.settings.memory_size, 128)
  timeout                        = try(var.settings.timeout, 3)
  architectures                  = try(var.settings.architectures, ["x86_64"])
  reserved_concurrent_executions = try(var.settings.reserved_concurrent_executions, -1)
  publish                        = try(var.settings.publish, false)

  dynamic "environment" {
    for_each = try(var.settings.environment, null) != null ? [var.settings.environment] : []
    content {
      variables = try(environment.value.variables, {})
    }
  }

  dynamic "file_system_config" {
    for_each = (
      try(var.settings.file_system_config, null) != null ||
      local.file_system_arn != null
    ) ? [1] : []
    content {
      arn              = try(local.file_system_arn, var.settings.file_system_config.arn)
      local_mount_path = try(var.settings.file_system_config.local_mount_path, "/mnt/data")
    }
  }

  dynamic "vpc_config" {
    for_each = try(var.settings.vpc_config, null) != null ? [1] : []
    content {
      subnet_ids = (
        length(try(local.subnet_ids, [])) > 0 ?
        local.subnet_ids :
        try(var.settings.vpc_config.subnet_ids, [])
      )
      security_group_ids = (
        length(try(local.security_group_ids, [])) > 0 ?
        local.security_group_ids :
        try(var.settings.vpc_config.security_group_ids, [])
      )
      ipv6_allowed_for_dual_stack = try(var.settings.vpc_config.ipv6_allowed_for_dual_stack, false)
    }
  }

  dynamic "logging_config" {
    for_each = try(var.settings.logging_config, null) != null ? [1] : []
    content {
      log_format            = try(var.settings.logging_config.log_format, "Text")
      application_log_level = try(var.settings.logging_config.application_log_level, "INFO")
      system_log_level      = try(var.settings.logging_config.system_log_level, "WARN")
      log_group             = try(local.log_group_name, var.settings.logging_config.log_group)
    }
  }
  dynamic "ephemeral_storage" {
    for_each = try(var.settings.ephemeral_storage, null) != null ? [var.settings.ephemeral_storage] : []
    content {
      size = try(ephemeral_storage.value.size, 512)
    }
  }

  dynamic "snap_start" {
    for_each = try(var.settings.snap_start, null) != null ? [var.settings.snap_start] : []
    content {
      apply_on = try(snap_start.value.apply_on, "PublishedVersions")
    }
  }

  dynamic "image_config" {
    for_each = try(var.settings.image_config, null) != null ? [var.settings.image_config] : []
    content {
      command           = try(image_config.value.command, null)
      entry_point       = try(image_config.value.entry_point, null)
      working_directory = try(image_config.value.working_directory, null)
    }
  }

  dynamic "dead_letter_config" {
    for_each = try(var.settings.dead_letter_config, null) != null ? [1] : []
    content {
      target_arn = try(var.settings.dead_letter_config.target_arn, null)
    }
  }

  dynamic "tracing_config" {
    for_each = try(var.settings.tracing_config, null) != null ? [1] : []
    content {
      mode = try(var.settings.tracing_config.mode, "PassThrough")
    }
  }

  depends_on = [
    var.resources.iam_roles
  ]
  tags = local.tags
}
