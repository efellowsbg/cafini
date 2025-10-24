resource "aws_config_configuration_recorder" "main" {
  role_arn = local.role_arn
  name     = try(var.settings.name, null)
  region   = try(var.settings.region, null)

  dynamic "custom_policy_details" {
    for_each = can(var.settings.source.custom_policy_details) ? [1] : []
    content {
      enable_debug_log_delivery = try(var.settings.source.custom_policy_details.enable_debug_log_delivery, null)
      policy_runtime            = var.settings.source.custom_policy_details.event_source
      policy_text               = var.settings.source.custom_policy_details.maximum_execution_frequency
    }
  }

  dynamic "recording_group" {
    for_each = can(var.settings.recording_group) ? [1] : []

    content {
      all_supported                 = try(var.settings.recording_group.all_supported, null)
      resource_types                = try(var.settings.recording_group.resource_types, null)
      include_global_resource_types = try(var.settings.recording_group.include_global_resource_types, null)

      dynamic "exclusion_by_resource_types" {
        for_each = can(var.settings.recording_group.exclusion_by_resource_types) ? [1] : []
        content {
          resource_types = try(var.settings.recording_group.exclusion_by_resource_types.resource_types, null)
        }
      }
      dynamic "recording_strategy" {
        for_each = can(var.settings.recording_group.recording_strategy) ? [1] : []
        content {
          use_only = try(var.settings.recording_group.recording_strategy.use_only, null)
        }
      }
    }
  }

  dynamic "recording_mode" {
    for_each = can(var.settings.recording_mode) ? [1] : []

    content {
      recording_frequency = var.settings.recording_mode.recording_frequency

      dynamic "recording_mode_override" {
        for_each = try(var.settings.recording_mode.recording_mode_override, {})
        content {
          resource_types      = recording_mode_override.value.resource_types
          recording_frequency = recording_mode_override.value.recording_frequency
          description         = try(recording_mode_override.value.description, null)
        }
      }
    }
  }
}
