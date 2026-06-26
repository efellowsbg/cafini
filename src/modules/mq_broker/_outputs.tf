output "arn" {
  value = try(aws_mq_broker.main.arn, null)
}

output "id" {
  value = try(aws_mq_broker.main.id, null)
}

output "instances" {
  value = try(aws_mq_broker.main.instances, null)
}

output "ip_address" {
  value = try(aws_mq_broker.main.ip_address, null)
}

output "primary_console_url" {
  value = try(aws_mq_broker.main.primary_console_url, null)
}
