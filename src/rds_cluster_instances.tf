module "rds_cluster_instances" {
  source   = "./modules/rds_cluster_instance"
  for_each = var.rds_cluster_instances

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    rds_clusters          = module.rds_clusters
    iam_instance_profiles = module.iam_instance_profiles
    kms_keys              = module.kms_keys
    iam_roles             = module.iam_roles
    # db_parameter_groups           = module.db_parameter_groups
    # db_subnet_groups              = module.db_subnet_groups
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
