locals {
  instance_id = try(
    var.resources.instances[var.settings.instance_ref].id,
    try(var.settings.instance, null)
  )

  network_interface_id = try(
    var.resources.network_interfaces[var.settings.network_interface_ref].id,
    try(var.settings.network_interface, null)
  )

  ipam_pool_id = try(
    var.resources.ipam_pools[var.settings.ipam_pool_ref].id,
    try(var.settings.ipam_pool_id, null)
  )

  public_ipv4_pool = try(
    var.resources.public_ipv4_pools[var.settings.public_ipv4_pool_ref].id,
    try(var.settings.public_ipv4_pool, null)
  )

  customer_owned_ipv4_pool = try(
    var.resources.customer_ipv4_pools[var.settings.customer_owned_ipv4_pool_ref].id,
    try(var.settings.customer_owned_ipv4_pool, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
