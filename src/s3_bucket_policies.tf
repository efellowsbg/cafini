module "s3_bucket_policies" {
  source   = "./modules/s3_bucket_policy"
  for_each = var.s3_bucket_policies

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    s3_buckets   = module.s3_buckets
    iam_policies = module.iam_policy
  }
}
