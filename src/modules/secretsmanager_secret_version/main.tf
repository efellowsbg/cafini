resource "aws_secretsmanager_secret_version" "main" {
  secret_id      = local.secret_id
  secret_string  = try(var.settings.secret_string, null)
  secret_binary  = try(var.settings.secret_binary, null)
  version_stages = try(var.settings.version_stages, null)
}
