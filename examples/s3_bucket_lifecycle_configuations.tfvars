s3_bucket_lifecycle_configurations = {
  test_lifecycle = {
    bucket_ref = "test_bucket"
    rules = {
      rule1 = {
        id     = "expire-after-30-days"
        status = "Enabled"
        filter = {
          prefix = ""
        }
      }
    },
    rule2 = {
      id     = "transition-to-glacier"
      status = "Enabled"
      filter = {
        prefix = "archive/"
      }
      transition = [
        {
          days          = 60
          storage_class = "GLACIER"
        }
      ]
    }
  }
}
