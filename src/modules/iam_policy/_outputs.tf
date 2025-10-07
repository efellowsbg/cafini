output "id" {
  value = aws_iam_policy.main.id
}

output "arn" {
  value = aws_iam_policy.main.arn
}

output "policy_id" {
  value = aws_iam_policy.main.policy_id
}

output "json" {
  value = jsonencode(var.settings.policy)
}
