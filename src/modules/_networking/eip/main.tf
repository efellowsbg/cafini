resource "aws_eip" "main" {
  address                   = try(var.settings.address, null)
  associate_with_private_ip = try(var.settings.associate_with_private_ip, null)
  customer_owned_ipv4_pool  = local.customer_owned_ipv4_pool
  domain                    = try(var.settings.domain, "vpc")
  instance                  = local.instance_id
  ipam_pool_id              = local.ipam_pool_id
  network_border_group      = try(var.settings.network_border_group, null)
  network_interface         = local.network_interface_id
  public_ipv4_pool          = local.public_ipv4_pool
  region                    = try(var.settings.region, null)

  tags = local.tags
}
