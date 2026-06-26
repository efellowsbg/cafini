output "arn" {
  value = try(aws_secretsmanager_secret_version.main.arn, null)
}

output "id" {
  value = try(aws_secretsmanager_secret_version.main.id, null)
}

output "version_id" {
  value = try(aws_secretsmanager_secret_version.main.version_id, null)
}
