output "arn" {
  value = try(aws_sns_topic_subscription.main.arn, null)
}

output "id" {
  value = try(aws_sns_topic_subscription.main.id, null)
}

output "owner_id" {
  value = try(aws_sns_topic_subscription.main.owner_id, null)
}

output "pending_confirmation" {
  value = try(aws_sns_topic_subscription.main.pending_confirmation, null)
}
