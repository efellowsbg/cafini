sns_topics = {
  test_topic = {
    name                                  = "test-topic"
    display_name                          = "Test Topic"
    policy_ref                            = "policy_assume_test"
    application_success_feedback_role_ref = "role_test"
    fifo_topic                            = false
    content_based_dedup                   = false
  }
}

# pre-requisites
iam_roles = {
  role_test = {
    name                     = "test-role"
    description              = "Example IAM role"
    assume_principals        = ["ec2.amazonaws.com"]
    permissions_boundary_ref = "policy_boundary_test"
    max_session_duration     = 3600
  }
}

iam_policies = {
  policy_assume_test = {
    name = "assume-ec2"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
          Action = "sts:AssumeRole"
        }
      ]
    }
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
