output "id" {
  value = try(aws_s3_bucket_server_side_encryption_configuration.main.id, null)
}
