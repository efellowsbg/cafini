module "ecs_clusters" {
  source   = "./modules/ecs_cluster"
  for_each = var.ecs_clusters

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    kms_keys              = module.kms_keys
    s3_buckets            = module.s3_buckets
    cloudwatch_log_groups = module.cloudwatch_log_groups
  }
}
