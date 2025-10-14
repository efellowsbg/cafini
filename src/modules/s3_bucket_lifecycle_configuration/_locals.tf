locals {
  bucket_name = try(
    var.resources.s3_buckets[var.settings.bucket_ref].id,
    try(var.settings.bucket, null)
  )

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
