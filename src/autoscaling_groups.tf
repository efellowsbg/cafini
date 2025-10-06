module "autoscaling_groups" {
  source   = "./modules/autoscaling_group"
  for_each = var.autoscaling_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # availability_zones = module.availability_zones
    # ec2_capacity_reservations = module.ec2_capacity_reservations
    # launch_templates = module.launch_templates
    # launch_configurations = module.launch_configurations
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
