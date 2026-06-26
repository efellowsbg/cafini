resource "aws_vpc_peering_connection" "main" {
  vpc_id        = local.vpc_id
  peer_vpc_id   = local.peer_vpc_id
  peer_owner_id = try(var.settings.peer_owner_id, null)
  peer_region   = try(var.settings.peer_region, null)
  auto_accept   = try(var.settings.auto_accept, null)
  tags          = local.tags
}
