resource "aws_ec2_client_vpn_network_association" "main" {
  client_vpn_endpoint_id = local.client_vpn_endpoint_id
  subnet_id              = local.subnet_id
  security_groups        = local.security_groups
}
