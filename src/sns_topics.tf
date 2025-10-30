module "sns_topics" {
  source   = "./modules/sns_topic"
  for_each = var.sns_topics

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    kms_keys     = module.kms_keys
    iam_roles    = module.iam_roles
    iam_policies = module.iam_policies
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
