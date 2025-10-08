module "lambda_functions" {
  source   = "./modules/lambda_function"
  for_each = var.lambda_functions

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_roles             = try(module.iam_roles, null)
    cloudwatch_log_groups = module.cloudwatch_log_groups
    # s3_buckets           = module.s3_buckets
    # efs_access_points     = module.efs_access_points
    kms_keys = module.kms_keys
  }

  depends_on = [module.iam_roles]

}
