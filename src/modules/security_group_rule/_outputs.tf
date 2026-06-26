output "id" {
  value = try(aws_security_group_rule.main.id, null)
}
