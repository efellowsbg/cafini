module "iam_roles" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_policies           = module.iam_policies
    iam_policy_attachments = module.iam_policy_attachments
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
