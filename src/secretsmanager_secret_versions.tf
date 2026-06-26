module "secretsmanager_secret_versions" {
  source   = "./modules/secretsmanager_secret_version"
  for_each = var.secretsmanager_secret_versions

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    secretsmanager_secrets = module.secretsmanager_secrets
  }
}
