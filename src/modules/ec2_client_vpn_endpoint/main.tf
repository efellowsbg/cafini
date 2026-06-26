resource "aws_ec2_client_vpn_endpoint" "main" {
  description            = try(var.settings.description, null)
  server_certificate_arn = var.settings.server_certificate_arn
  client_cidr_block      = var.settings.client_cidr_block
  vpc_id                 = local.vpc_id
  split_tunnel           = try(var.settings.split_tunnel, null)
  transport_protocol     = try(var.settings.transport_protocol, null)
  vpn_port               = try(var.settings.vpn_port, null)
  dns_servers            = try(var.settings.dns_servers, null)
  security_group_ids     = local.security_group_ids
  self_service_portal    = try(var.settings.self_service_portal, null)
  session_timeout_hours  = try(var.settings.session_timeout_hours, null)

  dynamic "authentication_options" {
    for_each = try(var.settings.authentication_options, {})
    content {
      type                           = authentication_options.value.type
      active_directory_id            = try(authentication_options.value.active_directory_id, null)
      root_certificate_chain_arn     = try(authentication_options.value.root_certificate_chain_arn, null)
      saml_provider_arn              = try(authentication_options.value.saml_provider_arn, null)
      self_service_saml_provider_arn = try(authentication_options.value.self_service_saml_provider_arn, null)
    }
  }

  dynamic "connection_log_options" {
    for_each = try(var.settings.connection_log_options, null) != null ? [var.settings.connection_log_options] : []
    content {
      enabled               = connection_log_options.value.enabled
      cloudwatch_log_group  = try(var.resources.cloudwatch_log_groups[connection_log_options.value.cloudwatch_log_group_ref].name, try(connection_log_options.value.cloudwatch_log_group, null))
      cloudwatch_log_stream = try(connection_log_options.value.cloudwatch_log_stream, null)
    }
  }

  tags = local.tags
}
