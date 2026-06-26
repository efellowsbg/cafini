output "id" {
  value = try(aws_ec2_client_vpn_route.main.id, null)
}

output "origin" {
  value = try(aws_ec2_client_vpn_route.main.origin, null)
}

output "status" {
  value = try(aws_ec2_client_vpn_route.main.status, null)
}

output "type" {
  value = try(aws_ec2_client_vpn_route.main.type, null)
}
