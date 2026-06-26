resource "aws_vpc_peering_connection_options" "main" {
  vpc_peering_connection_id = local.vpc_peering_connection_id

  dynamic "accepter" {
    for_each = try(var.settings.accepter, null) != null ? [var.settings.accepter] : []
    content {
      allow_remote_vpc_dns_resolution = try(accepter.value.allow_remote_vpc_dns_resolution, null)
    }
  }

  dynamic "requester" {
    for_each = try(var.settings.requester, null) != null ? [var.settings.requester] : []
    content {
      allow_remote_vpc_dns_resolution = try(requester.value.allow_remote_vpc_dns_resolution, null)
    }
  }
}
