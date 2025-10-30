module "db_instances" {
  source   = "./modules/db_instance"
  for_each = var.db_instance

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # iam_roles = module.iam_roles
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
