output "fqdn" {
  value = try(aws_route53_record.main.fqdn, null)
}

output "id" {
  value = try(aws_route53_record.main.id, null)
}

output "name" {
  value = try(aws_route53_record.main.name, null)
}
