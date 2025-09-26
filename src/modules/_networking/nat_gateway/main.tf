resource "aws_nat_gateway" "main" {
  # TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  allocation_id = try(
    var.settings.allocation_id,
    try(var.resources.eip[each.key].id, null),
    null
  )
  connectivity_type = try(var.settings.connectivity_type, "public")

  private_ip = try(var.settings.private_ip, null)

  region = try(var.settings.region, null)

  subnet_id = try(
    var.settings.subnet_id,
    try(var.resources.subnet[each.key].id, null),
    null
  )

  secondary_allocation_ids           = try(var.settings.secondary_allocation_ids, null)
  secondary_private_ip_address_count = try(var.settings.secondary_private_ip_address_count, null)
  secondary_private_ip_addresses     = try(var.settings.secondary_private_ip_addresses, null)

  depends_on = try(var.settings.depends_on, [])
  tags = local.tags
}