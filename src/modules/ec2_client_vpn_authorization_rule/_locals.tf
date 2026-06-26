locals {
  client_vpn_endpoint_id = try(
    var.resources.ec2_client_vpn_endpoints[var.settings.client_vpn_endpoint_ref].id,
    try(var.settings.client_vpn_endpoint_id, null)
  )

}
