locals {
  secret_id = try(
    var.resources.secretsmanager_secrets[var.settings.secret_ref].id,
    try(var.settings.secret_id, null)
  )
}
