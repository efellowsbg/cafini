output "arn" {
  value = try(aws_sqs_queue.main.arn, null)
}

output "id" {
  value = try(aws_sqs_queue.main.id, null)
}

output "name" {
  value = try(aws_sqs_queue.main.name, null)
}
