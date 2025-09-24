resource "aws_subnet" "main" {
  for_each = var.settings.subnets
	
  vpc_id     																					= aws_vpc.main.id
  region		 																					= try(each.value.region, null)
  assign_ipv6_address_on_creation		 									= try(each.value.assign_ipv6_address_on_creation, null)
  availability_zone		 																= try(each.value.availability_zone, null)
  availability_zone_id		 														= try(each.value.availability_zone_id, null)
  cidr_block		 																			= try(each.value.cidr_block, null)
  customer_owned_ipv4_pool		 												= try(each.value.customer_owned_ipv4_pool, null)
  enable_dns64		 																		= try(each.value.enable_dns64, null)
  enable_lni_at_device_index		 											= try(each.value.enable_lni_at_device_index, null)
  enable_resource_name_dns_aaaa_record_on_launch		 	= try(each.value.enable_resource_name_dns_aaaa_record_on_launch, null)
  enable_resource_name_dns_a_record_on_launch		 			= try(each.value.enable_resource_name_dns_a_record_on_launch, null)
  ipv6_cidr_block		 																	= try(each.value.ipv6_cidr_block, null)
  ipv6_native		 																			= try(each.value.ipv6_native, null)
  map_customer_owned_ip_on_launch		 									= try(each.value.map_customer_owned_ip_on_launch, null)
  map_public_ip_on_launch		 													= try(each.value.map_public_ip_on_launch, null)
  outpost_arn		 																			= try(each.value.outpost_arn, null)
  private_dns_hostname_type_on_launch		 							= try(each.value.private_dns_hostname_type_on_launch, null)

  tags = local.tags
}