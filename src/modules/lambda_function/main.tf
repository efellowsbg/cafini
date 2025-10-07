resource "aws_lambda_function" "main" {
  function_name = var.settings.function_name
  role          = local.role_arn
  handler       = try(var.settings.handler, "index.handler")
  runtime       = try(var.settings.runtime, "python3.13")

  filename          = try(var.settings.filename, null)
  s3_bucket         = try(var.settings.s3_bucket, null)
  s3_key            = try(var.settings.s3_key, null)
  s3_object_version = try(var.settings.s3_object_version, null)
  image_uri         = try(var.settings.image_uri, null)

  description                    = try(var.settings.description, null)
  memory_size                    = try(var.settings.memory_size, 128)
  timeout                        = try(var.settings.timeout, 3)
  architectures                  = try(var.settings.architectures, ["x86_64"])
  reserved_concurrent_executions = try(var.settings.reserved_concurrent_executions, -1)
  publish                        = try(var.settings.publish, false)

  dynamic "environment" {
    for_each = try(var.settings.environment, null) != null ? [1] : []
    content {
      variables = var.settings.environment.variables
    }
  }

  dynamic "file_system_config" {
    for_each = local.file_system_arn != null ? [1] : []
    content {
      arn              = local.file_system_arn
      local_mount_path = try(var.settings.file_system_config.local_mount_path, "/mnt/data")
    }
  }

  dynamic "vpc_config" {
    for_each = try(var.settings.vpc_config, null) != null ? [1] : []
    content {
      subnet_ids                  = try(var.settings.vpc_config.subnet_ids, [])
      security_group_ids          = try(var.settings.vpc_config.security_group_ids, [])
      ipv6_allowed_for_dual_stack = try(var.settings.vpc_config.ipv6_allowed_for_dual_stack, false)
    }
  }

  dynamic "logging_config" {
    for_each = try(var.settings.logging_config, null) != null ? [1] : []
    content {
      log_format            = try(var.settings.logging_config.log_format, "Text")
      application_log_level = try(var.settings.logging_config.application_log_level, "INFO")
      system_log_level      = try(var.settings.logging_config.system_log_level, "WARN")
      log_group             = local.log_group_name
    }
  }

  dynamic "dead_letter_config" {
    for_each = try(var.settings.dead_letter_config, null) != null ? [1] : []
    content {
      target_arn = var.settings.dead_letter_config.target_arn
    }
  }

  dynamic "tracing_config" {
    for_each = try(var.settings.tracing_config, null) != null ? [1] : []
    content {
      mode = var.settings.tracing_config.mode
    }
  }

  tags = local.tags
}
