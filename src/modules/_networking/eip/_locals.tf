locals {
  instance = try(
    var.resources.instances[var.settings.instance_ref].id,
    try(var.settings.instance, null)
  )

  network_interface = try(
    var.resources.network_interfaces[var.settings.network_interface_ref].id,
    try(var.settings.network_interface, null)
  )

  ipam_pool_id = try(
    var.resources.ipam_pools[var.settings.ipam_pool_ref].id,
    try(var.settings.ipam_pool_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
