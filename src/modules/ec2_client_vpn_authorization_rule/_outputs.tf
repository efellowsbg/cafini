output "id" {
  value = try(aws_ec2_client_vpn_authorization_rule.main.id, null)
}

output "status" {
  value = try(aws_ec2_client_vpn_authorization_rule.main.status, null)
}
