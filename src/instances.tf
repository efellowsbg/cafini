module "instances" {
  source   = "./modules/instance"
  for_each = var.instances

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # iam_instance_profiles     = module.iam_instance_profiles
    # ec2_capacity_reservations = module.ec2_capacity_reservations
    # ec2_hosts                 = module.ec2_hosts
    # resourcegroups_groups     = module.resourcegroups_groups
    # placement_groups          = module.placement_groups
    # availability_zones        = module.availability_zones
    # kms_keys                  = module.kms_keys
    # security_groups           = module.security_groups
    # network_interfaces        = module.network_interfaces
    # vpcs = module.vpcs
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
