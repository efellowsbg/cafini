locals {
  vpc_id = try(
    var.resources.vpcs[var.settings.vpc_ref].id,
    try(var.settings.vpc_id, null)
  )

  peer_vpc_id = try(
    var.resources.vpcs[var.settings.peer_vpc_ref].id,
    try(var.settings.peer_vpc_id, null)
  )

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
