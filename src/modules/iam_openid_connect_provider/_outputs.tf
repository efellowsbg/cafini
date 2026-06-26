output "arn" {
  value = try(aws_iam_openid_connect_provider.main.arn, null)
}

output "id" {
  value = try(aws_iam_openid_connect_provider.main.id, null)
}

output "url" {
  value = try(aws_iam_openid_connect_provider.main.url, null)
}
