output "instance_profile_id" {
  description = "The ID of the IAM instance profile"
  value       = aws_iam_instance_profile.main.id
}

output "instance_profile_arn" {
  description = "The ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.main.arn
}

output "instance_profile_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_instance_profile.main.unique_id
}

output "instance_profile_tags_all" {
  description = "All tags assigned to the instance profile"
  value       = aws_iam_instance_profile.main.tags_all
}