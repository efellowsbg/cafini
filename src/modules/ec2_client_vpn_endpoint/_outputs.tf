output "arn" {
  value = try(aws_ec2_client_vpn_endpoint.main.arn, null)
}

output "dns_name" {
  value = try(aws_ec2_client_vpn_endpoint.main.dns_name, null)
}

output "id" {
  value = try(aws_ec2_client_vpn_endpoint.main.id, null)
}

output "status" {
  value = try(aws_ec2_client_vpn_endpoint.main.status, null)
}
