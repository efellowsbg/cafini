output "arn" {
  value = try(aws_ssm_parameter.main.arn, null)
}

output "id" {
  value = try(aws_ssm_parameter.main.id, null)
}

output "name" {
  value = try(aws_ssm_parameter.main.name, null)
}

output "type" {
  value = try(aws_ssm_parameter.main.type, null)
}

output "value" {
  value = try(aws_ssm_parameter.main.value, null)
}

output "version" {
  value = try(aws_ssm_parameter.main.version, null)
}
