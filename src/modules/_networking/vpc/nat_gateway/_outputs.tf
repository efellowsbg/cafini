output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "nat_gateway_network_interface_id" {
  value = aws_nat_gateway.main.network_interface_id
}

output "nat_gateway_public_ip" {
  value = try(aws_nat_gateway.main.public_ip, null)
}

output "nat_gateway_association_id" {
  value = try(aws_nat_gateway.main.association_id, null)
}

output "nat_gateway_tags_all" {
  value = aws_nat_gateway.main.tags_all
}