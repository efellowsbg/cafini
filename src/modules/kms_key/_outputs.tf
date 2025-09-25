output "kms_key_id" {
  description = "The globally unique identifier for the KMS key"
  value       = aws_kms_key.main.key_id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.main.arn
}

output "kms_key_tags_all" {
  description = "All tags assigned to the KMS key"
  value       = aws_kms_key.main.tags_all
}