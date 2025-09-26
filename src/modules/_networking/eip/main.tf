resource "aws_eip" "main" {
# TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  address                   = try(var.settings.address, null)
  associate_with_private_ip  = try(var.settings.associate_with_private_ip, null)
  customer_owned_ipv4_pool   = try(var.settings.customer_owned_ipv4_pool, null)
  domain                     = try(var.settings.domain, "vpc")
  
  instance = try(
    var.settings.instance,
    try(var.resources.instance[each.key].id, null),
    null
  )

  ipam_pool_id         = try(var.settings.ipam_pool_id, null)
  network_border_group = try(var.settings.network_border_group, null)

  network_interface = try(
    var.settings.network_interface,
    try(var.resources.eni[each.key].id, null),
    null
  )

  public_ipv4_pool = try(var.settings.public_ipv4_pool, null)
  region           = try(var.settings.region, null)
  tags             = local.tags

  depends_on = try(var.settings.depends_on, [])
}