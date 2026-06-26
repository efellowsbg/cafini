resource "aws_ec2_client_vpn_authorization_rule" "main" {
  client_vpn_endpoint_id = local.client_vpn_endpoint_id
  target_network_cidr    = var.settings.target_network_cidr
  access_group_id        = try(var.settings.access_group_id, null)
  authorize_all_groups   = try(var.settings.authorize_all_groups, null)
  description            = try(var.settings.description, null)
}
