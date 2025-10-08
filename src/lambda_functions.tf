module "lambda_functions" {
  source   = "./modules/lambda_function"
  for_each = try(var.lambda_functions, {})

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_roles             = try(module.iam_roles, {})
    cloudwatch_log_groups = try(module.cloudwatch_log_groups, {})
    # efs_access_points     = try(module.efs_access_points, {})
    kms_keys = try(module.kms_keys, {})
  }

}
