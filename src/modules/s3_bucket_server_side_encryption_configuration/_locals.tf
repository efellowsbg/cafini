locals {
  bucket = try(
    var.resources.s3_buckets[var.settings.bucket_ref].id,
    try(var.settings.bucket, null)
  )
}
