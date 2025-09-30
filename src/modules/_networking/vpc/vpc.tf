resource "aws_vpc" "main" {
  region                               = try(var.settings.region, null)
  cidr_block                           = try(var.settings.cidr_block, null)
  instance_tenancy                     = try(var.settings.instance_tenancy, null)
  ipv4_netmask_length                  = try(var.settings.ipv4_netmask_length, null)
  ipv6_cidr_block                      = try(var.settings.ipv6_cidr_block, null)
  ipv6_netmask_length                  = try(var.settings.ipv6_netmask_length, null)
  enable_dns_support                   = try(var.settings.enable_dns_support, null)
  enable_dns_hostnames                 = try(var.settings.enable_dns_hostnames, null)
  assign_generated_ipv6_cidr_block     = try(var.settings.assign_generated_ipv6_cidr_block, null)
  enable_network_address_usage_metrics = try(var.settings.enable_network_address_usage_metrics, null)
  ipv6_cidr_block_network_border_group = try(var.settings.ipv6_cidr_block_network_border_group, null)
  ipv4_ipam_pool_id                    = local.ipv4_ipam_pool_id
  ipv6_ipam_pool_id                    = local.ipv6_ipam_pool_id
  tags                                 = local.tags
}
