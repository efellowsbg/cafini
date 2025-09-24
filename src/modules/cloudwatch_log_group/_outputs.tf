output "log_group_id" {
  value       = aws_cloudwatch_log_group.main.id
}

output "log_group_arn" {
  value       = aws_cloudwatch_log_group.main.arn
}