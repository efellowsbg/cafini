output "id" {
  value = aws_efs_file_system.main.id
}

output "arn" {
  value = aws_efs_file_system.main.arn
}

output "dns_name" {
  value = aws_efs_file_system.main.dns_name
}

output "tags" {
  value = aws_efs_file_system.main.tags_all
}

output "size_in_bytes" {
  value = try(aws_efs_file_system.main.size_in_bytes[0].value, null)
}
