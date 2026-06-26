resource "aws_sesv2_configuration_set_event_destination" "main" {
  configuration_set_name = local.configuration_set_name
  event_destination_name = var.settings.event_destination_name

  event_destination {
    enabled              = try(var.settings.event_destination.enabled, null)
    matching_event_types = var.settings.event_destination.matching_event_types

    dynamic "sns_destination" {
      for_each = try(var.settings.event_destination.sns_destination, null) != null ? [var.settings.event_destination.sns_destination] : []
      content {
        topic_arn = try(var.resources.sns_topics[sns_destination.value.topic_ref].arn, try(sns_destination.value.topic_arn, null))
      }
    }
  }
}
