s3_buckets = {
  test_bucket = {
    bucket        = "martin-caf-bucket"
    force_destroy = true
    kms_key_ref   = "kms_keys_test"
    server_side_encryption_configuration = {
      sse_algorithm      = "aws:kms"
      bucket_key_enabled = true
    }
    lifecycle_rules = [
      {
        id         = "expire-30-days"
        enabled    = true
        expiration = { days = 30 }
      }
    ]
  }
}
