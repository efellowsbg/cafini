resource "aws_nat_gateway" "main" {
  allocation_id                      = local.allocation_id
  connectivity_type                  = try(var.settings.connectivity_type, null)
  private_ip                         = try(var.settings.private_ip, null)
  region                             = try(var.settings.region, null)
  subnet_id                          = local.subnet_id
  secondary_allocation_ids           = local.secondary_allocation_ids
  secondary_private_ip_address_count = try(var.settings.secondary_private_ip_address_count, null)
  secondary_private_ip_addresses     = try(var.settings.secondary_private_ip_addresses, null)

  tags = local.tags
}
