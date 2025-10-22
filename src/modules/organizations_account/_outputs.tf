output "id" {
  value = aws_organizations_account.main.id
}

output "arn" {
  value = aws_organizations_account.main.arn
}

output "email" {
  value = aws_organizations_account.main.email
}

output "name" {
  value = aws_organizations_account.main.name
}

output "govcloud_id" {
  value = try(aws_organizations_account.main.govcloud_id, null)
}
