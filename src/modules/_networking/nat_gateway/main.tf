resource "aws_nat_gateway" "main" {
  subnet_id  = var.settings.subnet_id

  # Public NAT → allocation_id required
  allocation_id     = try(var.settings.allocation_id, null)

  # Private NAT → connectivity_type = "private"
  connectivity_type = try(var.settings.connectivity_type, null)

  private_ip                         = try(var.settings.private_ip, null)
  secondary_allocation_ids           = try(var.settings.secondary_allocation_ids, null)
  secondary_private_ip_address_count = try(var.settings.secondary_private_ip_address_count, null)
  secondary_private_ip_addresses     = try(var.settings.secondary_private_ip_addresses, null)

  depends_on = try(var.settings.depends_on, [])

  tags = local.tags
}
