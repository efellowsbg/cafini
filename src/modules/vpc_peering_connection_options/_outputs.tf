output "id" {
  value = try(aws_vpc_peering_connection_options.main.id, null)
}
