module "secretsmanager_secrets" {
  source = "./modules/secretsmanager_secret"
  for_each = var.secretsmanager_secrets

	settings        = each.value
  global_settings = local.global_settings

  resources = {
    # kms_keys = module.kms_keys
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}