resource "aws_s3_bucket_policy" "main" {
  bucket = local.bucket_name
  policy = local.policy

  # Optional: region override
  region = try(var.settings.region, null)
}
