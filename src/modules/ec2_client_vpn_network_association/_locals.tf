locals {
  client_vpn_endpoint_id = try(
    var.resources.ec2_client_vpn_endpoints[var.settings.client_vpn_endpoint_ref].id,
    try(var.settings.client_vpn_endpoint_id, null)
  )

  subnet_id = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id,
    try(var.settings.subnet_id, null)
  )

  security_groups = length(try(var.settings.security_group_refs, [])) > 0 ? [
    for ref in var.settings.security_group_refs : var.resources.security_groups[ref].id
  ] : try(var.settings.security_groups, null)
}
