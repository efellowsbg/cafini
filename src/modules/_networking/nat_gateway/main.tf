resource "aws_nat_gateway" "main" {
# TODO: Add doublecheck for missing arguments, reference to resources and dynamic blocks
  allocation_id                    = try(var.settings.allocation_id, null)
  connectivity_type                 = try(var.settings.connectivity_type, null)
  private_ip                        = try(var.settings.private_ip, null)
  region                            = try(var.settings.region, null)
  subnet_id                         = var.settings.subnet_id
  secondary_allocation_ids          = try(var.settings.secondary_allocation_ids, null)
  secondary_private_ip_address_count = try(var.settings.secondary_private_ip_address_count, null)
  secondary_private_ip_addresses    = try(var.settings.secondary_private_ip_addresses, null)
  # Explicit dependency if using public NAT
  depends_on = try(var.settings.depends_on, null)
  tags = local.tags
}