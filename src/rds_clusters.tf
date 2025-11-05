module "rds_clusters" {
  source   = "./modules/rds_cluster"
  for_each = var.rds_clusters

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_roles       = module.iam_roles
    security_groups = module.security_groups
    s3_buckets      = module.s3_buckets
    kms_keys        = module.kms_keys
    # directory_service_directories = module.directory_service_directories
    # db_parameter_groups           = module.db_parameter_groups
    # db_subnet_groups              = module.db_subnet_groups
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
