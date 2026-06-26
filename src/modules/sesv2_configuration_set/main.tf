resource "aws_sesv2_configuration_set" "main" {
  configuration_set_name = var.settings.configuration_set_name

  dynamic "sending_options" {
    for_each = try(var.settings.sending_options, null) != null ? [var.settings.sending_options] : []
    content {
      sending_enabled = try(sending_options.value.sending_enabled, null)
    }
  }

  tags = local.tags
}
