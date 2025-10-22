resource "aws_config_config_rule" "main" {
  name                        = var.settings.name
  description                 = try(var.settings.description, null)
  input_parameters            = try(var.settings.input_parameters, null)
  maximum_execution_frequency = try(var.settings.maximum_execution_frequency, null)

  tags = local.tags

  source {
    owner             = var.settings.source.owner
    source_identifier = local.source_identifier

    dynamic "source_details" {
      for_each = try(var.settings.source.source_details, {})
      content {
        event_source                = try(source_details.value.event_source, null)
        maximum_execution_frequency = try(source_details.value.maximum_execution_frequency, null)
        message_type                = try(source_details.value.message_type, null)
      }
    }

    dynamic "custom_policy_details" {
      for_each = can(var.settings.source.custom_policy_details) ? [1] : []
      content {
        enable_debug_log_delivery = try(var.settings.source.custom_policy_details.enable_debug_log_delivery, null)
        policy_runtime            = var.settings.source.custom_policy_details.event_source
        policy_text               = var.settings.source.custom_policy_details.maximum_execution_frequency
      }
    }
  }

  dynamic "scope" {
    for_each = try(var.settings.scopes, {})
    content {
      compliance_resource_id    = try(scope.value.compliance_resource_id, null)
      compliance_resource_types = try(scope.value.compliance_resource_types, null)
      tag_key                   = try(scope.value.tag_key, null)
      tag_value                 = try(scope.value.tag_value, null)
    }
  }

  dynamic "evaluation_mode" {
    for_each = can(var.settings.evaluation_mode) ? [1] : []
    content {
      mode = try(var.settings.evaluation_mode.mode, null)
    }
  }
}
