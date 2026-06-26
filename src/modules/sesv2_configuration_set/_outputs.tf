output "arn" {
  value = try(aws_sesv2_configuration_set.main.arn, null)
}

output "configuration_set_name" {
  value = try(aws_sesv2_configuration_set.main.configuration_set_name, null)
}

output "id" {
  value = try(aws_sesv2_configuration_set.main.id, null)
}
