resource "aws_vpc_endpoint" "main" {
  # TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  vpc_id                     = var.settings.vpc_id
  vpc_endpoint_type          = try(var.settings.vpc_endpoint_type, null)
  service_name               = try(var.settings.service_name, null)
  service_region             = try(var.settings.service_region, null)
  resource_configuration_arn = try(var.settings.resource_configuration_arn, null)
  service_network_arn        = try(var.settings.service_network_arn, null)
  auto_accept                = try(var.settings.auto_accept, null)
  policy                     = try(var.settings.policy, null)
  private_dns_enabled        = try(var.settings.private_dns_enabled, null)
  ip_address_type            = try(var.settings.ip_address_type, null)
  route_table_ids            = try(var.settings.route_table_ids, null)
  subnet_ids                 = try(var.settings.subnet_ids, null)
  security_group_ids         = try(var.settings.security_group_ids, null)
  region                     = try(var.settings.region, null)
  tags                       = local.tags

  dynamic "dns_options" {
    for_each = try(var.settings.dns_options, null) == null ? [] : [var.settings.dns_options]
    content {
      dns_record_ip_type                             = try(dns_options.value.dns_record_ip_type, null)
      private_dns_only_for_inbound_resolver_endpoint = try(dns_options.value.private_dns_only_for_inbound_resolver_endpoint, null)
    }
  }

  dynamic "subnet_configuration" {
    for_each = try(var.settings.subnet_configuration, [])
    content {
      ipv4      = try(subnet_configuration.value.ipv4, null)
      ipv6      = try(subnet_configuration.value.ipv6, null)
      subnet_id = subnet_configuration.value.subnet_id
    }
  }
}
