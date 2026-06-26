output "accept_status" {
  value = try(aws_vpc_peering_connection.main.accept_status, null)
}

output "id" {
  value = try(aws_vpc_peering_connection.main.id, null)
}

output "peer_owner_id" {
  value = try(aws_vpc_peering_connection.main.peer_owner_id, null)
}

output "peer_region" {
  value = try(aws_vpc_peering_connection.main.peer_region, null)
}

output "peer_vpc_id" {
  value = try(aws_vpc_peering_connection.main.peer_vpc_id, null)
}

output "vpc_id" {
  value = try(aws_vpc_peering_connection.main.vpc_id, null)
}
