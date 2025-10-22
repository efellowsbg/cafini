cloudtrails = {
  cloudtrail_test = {
    name                          = "test-cloudtrail"
    s3_bucket_name_ref            = "test_bucket"
    cloudwatch_logs_group_ref     = "clg_test"
    cloud_watch_logs_role_arn_ref = "role_test"
    kms_key_ref                   = "kms_keys_test"

    advanced_event_selectors = {
      adv_ev_sel_test = {
        name = "AllManagementEvents"

        field_selectors = {

          field_selector_1 = {
            field  = "eventCategory"
            equals = ["Management"]
          }

          field_selector_2 = {
            field  = "readOnly"
            equals = ["false"]
          }

        }
      }
    }
  }
}

# pre-requisites
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

kms_keys = {
  kms_keys_test = {
    description             = "KMS key using referenced IAM policy"
    key_usage               = "ENCRYPT_DECRYPT"
    enable_key_rotation     = true
    deletion_window_in_days = 30
    multi_region            = true
    policy_ref              = "policy_assume_test"
  }
}

cloudwatch_log_groups = {
  clg_test = {
    name              = "clg-test"
    retention_in_days = 14
    region            = "eu-west-1"
  }
}

iam_roles = {
  role_test = {
    name                     = "test-role"
    description              = "Example IAM role"
    assume_principals        = ["ec2.amazonaws.com"]
    permissions_boundary_ref = "policy_boundary_test"
    max_session_duration     = 3600
  }
}
