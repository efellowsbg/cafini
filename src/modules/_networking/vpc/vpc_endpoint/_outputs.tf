output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.main.id
}

output "vpc_endpoint_arn" {
  value = aws_vpc_endpoint.main.arn
}

output "vpc_endpoint_state" {
  value = aws_vpc_endpoint.main.state
}

output "vpc_endpoint_dns_entry" {
  value = try(aws_vpc_endpoint.main.dns_entry, null)
}

output "vpc_endpoint_network_interface_ids" {
  value = try(aws_vpc_endpoint.main.network_interface_ids, null)
}

output "vpc_endpoint_prefix_list_id" {
  value = try(aws_vpc_endpoint.main.prefix_list_id, null)
}

output "vpc_endpoint_tags_all" {
  value = aws_vpc_endpoint.main.tags_all
}
