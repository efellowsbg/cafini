locals {
  ipv4_ipam_pool_id = try(
    var.resources.ipv4_ipam_pools[var.settings.ipv4_ipam_pool_ref].id,
    try(var.settings.ipv4_ipam_pool_id, null)
  )

  ipv6_ipam_pool_id = try(
    var.resources.ipv6_ipam_pools[var.settings.ipv6_ipam_pool_ref].id,
    try(var.settings.ipv6_ipam_pool_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
