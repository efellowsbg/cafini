module "directory_service_directories" {
  source   = "./modules/directory_service_directory"
  for_each = var.directory_service_directories

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    vpcs = module.vpcs
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
