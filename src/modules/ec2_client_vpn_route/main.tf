resource "aws_ec2_client_vpn_route" "main" {
  client_vpn_endpoint_id = local.client_vpn_endpoint_id
  destination_cidr_block = var.settings.destination_cidr_block
  target_vpc_subnet_id   = local.target_vpc_subnet_id
  description            = try(var.settings.description, null)
}
