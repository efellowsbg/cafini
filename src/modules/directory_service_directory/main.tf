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

  dynamic "connecting_settings" {
    for_each = can(var.settings.connecting_settings) ? [1] : []
    content {
      customer_username = var.settings.connecting_settings.customer_username
      customer_dns_ips  = var.settings.connecting_settings.customer_dns_ips
      subnet_ids        = try(local.con_subnet_ids, var.settings.connecting_settings.subnet_ids)
      vpc_id            = try(local.con_vpc_id, var.settings.connecting_settings.vpc_id)
    }
  }

  dynamic "vpc_settings" {
    for_each = can(var.settings.vpc_settings) ? [1] : []
    content {
      vpc_id     = local.vpc_id
      subnet_ids = local.subnet_ids
    }
  }
}
