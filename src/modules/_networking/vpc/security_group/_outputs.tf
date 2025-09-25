output "security_group_id" {
  value = aws_security_group.main.id
}

output "security_group_arn" {
  value = aws_security_group.main.arn
}

output "security_group_owner_id" {
  value = aws_security_group.main.owner_id
}

output "security_group_tags_all" {
  value = aws_security_group.main.tags_all
}