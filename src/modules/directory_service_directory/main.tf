resource "aws_directory_service_directory" "main" {
  name                                 = var.settings.name
  password                             = var.settings.password
  region                               = try(var.settings.region, null)
  size                                 = try(var.settings.size, null)
  alias                                = try(var.settings.alias, null)
  description                          = try(var.settings.description, null)
  desired_number_of_domain_controllers = try(var.settings.desired_number_of_domain_controllers, null)
  short_name                           = try(var.settings.short_name, null)
  enable_sso                           = try(var.settings.enable_sso, null)
  edition                              = try(var.settings.edition, null)
  type                                 = var.settings.type
  tags                                 = local.tags

  dynamic "connect_settings" {
    for_each = can(var.settings.connect_settings) ? [1] : []
    content {
      customer_username = var.settings.connect_settings.customer_username
      customer_dns_ips  = var.settings.connect_settings.customer_dns_ips
      vpc_id = (
        var.settings.connect_settings.vpc_ref != null
        ? var.resources.vpcs[var.settings.connect_settings.vpc_ref].id
        : var.settings.connect_settings.vpc_id
      )
      subnet_ids = length(try(var.settings.connect_settings.subnet_refs, [])) > 0 ? [
        for ref in var.settings.connect_settings.subnet_refs :
        var.resources.vpcs[var.settings.connect_settings.vpc_ref].subnets[ref].id
      ] : var.settings.connect_settings.subnet_ids
    }
  }

  dynamic "vpc_settings" {
    for_each = can(var.settings.vpc_settings) ? [1] : []
    content {
      vpc_id = (
        var.settings.vpc_settings.vpc_ref != null
        ? var.resources.vpcs[var.settings.vpc_settings.vpc_ref].id
        : var.settings.vpc_settings.vpc_id
      )
      subnet_ids = length(try(var.settings.vpc_settings.subnet_refs, [])) > 0 ? [
        for ref in var.settings.vpc_settings.subnet_refs :
        var.resources.vpcs[var.settings.vpc_settings.vpc_ref].subnets[ref].id
      ] : var.settings.vpc_settings.subnet_ids
    }
  }
}
