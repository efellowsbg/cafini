output "association_id" {
  value = try(aws_ec2_client_vpn_network_association.main.association_id, null)
}

output "id" {
  value = try(aws_ec2_client_vpn_network_association.main.id, null)
}

output "security_groups" {
  value = try(aws_ec2_client_vpn_network_association.main.security_groups, null)
}

output "status" {
  value = try(aws_ec2_client_vpn_network_association.main.status, null)
}
