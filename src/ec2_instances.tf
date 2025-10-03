module "ec2_instances" {
  source   = "./modules/ec_instance"
  for_each = var.ec2_instances

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # availability_zones        = module.availability_zones
    # ec2_capacity_reservations = module.ec2_capacity_reservations
    # kms_keys                  = module.kms_keys
    # ec2_hosts                 = module.ec2_hosts
    # resourcegroups_groups     = module.resourcegroups_groups
    # iam_instance_profiles     = module.iam_instance_profiles
    # launch_templates          = module.launch_templates
    # placement_groups          = module.placement_groups
    # security_groups           = module.security_groups
    # network_interfaces        = module.network_interfaces
    vpcs = module.vpcs
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
