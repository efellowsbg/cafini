locals {
  client_vpn_endpoint_id = try(
    var.resources.ec2_client_vpn_endpoints[var.settings.client_vpn_endpoint_ref].id,
    try(var.settings.client_vpn_endpoint_id, null)
  )

  target_vpc_subnet_id = try(
    var.resources.vpcs[split("/", var.settings.target_vpc_subnet_ref)[0]].subnets[split("/", var.settings.target_vpc_subnet_ref)[1]].id,
    try(var.settings.target_vpc_subnet_id, null)
  )
}
