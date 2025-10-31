module "db_instances" {
  source   = "./modules/db_instance"
  for_each = var.db_instances

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    secretsmanager_secrets = module.secretsmanager_secrets
    iam_roles              = module.iam_roles
    security_groups        = module.security_groups
    # directory_service_directories = module.directory_service_directories
    # db_option_groups              = module.db_option_groups
    # db_parameter_groups           = module.db_parameter_groups
    # db_subnet_groups              = module.db_subnet_groups
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
