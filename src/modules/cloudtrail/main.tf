resource "aws_cloudtrail" "main" {
  name                          = var.settings.name
  s3_bucket_name                = local.s3_bucket_name
  cloud_watch_logs_group_arn    = local.cloud_watch_logs_group_arn
  cloud_watch_logs_role_arn     = local.cloud_watch_logs_role_arn
  kms_key_id                    = local.kms_key_id
  region                        = try(var.settings.region, null)
  enable_log_file_validation    = try(var.settings.enable_log_file_validation, null)
  enable_logging                = try(var.settings.enable_logging, null)
  include_global_service_events = try(var.settings.include_global_service_events, null)
  is_multi_region_trail         = try(var.settings.is_multi_region_trail, null)
  is_organization_trail         = try(var.settings.is_organization_trail, null)
  s3_key_prefix                 = try(var.settings.s3_key_prefix, null)
  sns_topic_name                = try(var.settings.sns_topic_name, null)
  tags                          = local.tags

  dynamic "advanced_event_selector" {
    for_each = try(var.settings.advanced_event_selectors, {})
    content {
      name = try(advanced_event_selector.value.name, null)

      dynamic "field_selector" {
        for_each = advanced_event_selector.value.field_selectors
        content {
          field           = field_selector.value.field
          ends_with       = try(field_selector.value.ends_with, null)
          equals          = try(field_selector.value.equals, null)
          not_ends_with   = try(field_selector.value.not_ends_with, null)
          not_equals      = try(field_selector.value.not_equals, null)
          not_starts_with = try(field_selector.value.not_starts_with, null)
          starts_with     = try(field_selector.value.starts_with, null)
        }
      }
    }
  }

  dynamic "event_selector" {
    for_each = try(var.settings.event_selectors, {})
    content {
      exclude_management_event_sources = try(event_selector.value.exclude_management_event_sources, null)
      include_management_events        = try(event_selector.value.include_management_events, null)
      read_write_type                  = try(event_selector.value.read_write_type, null)

      dynamic "data_resource" {
        for_each = try(event_selector.value.data_resources, {})
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
      data_resource {
        type   = try(event_selector.value.data_resource.type, null)
        values = try(event_selector.value.data_resource.values, null)
      }
    }
  }
}
