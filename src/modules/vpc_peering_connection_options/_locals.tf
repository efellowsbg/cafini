locals {
  vpc_peering_connection_id = try(
    var.resources.vpc_peering_connections[var.settings.vpc_peering_connection_ref].id,
    try(var.settings.vpc_peering_connection_id, null)
  )
}
