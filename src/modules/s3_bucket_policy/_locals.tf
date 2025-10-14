locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  bucket_name = try(
    var.resources.s3_buckets[var.settings.bucket_ref].id, var.settings.bucket
  )

  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json, var.settings.policy
  )
}
