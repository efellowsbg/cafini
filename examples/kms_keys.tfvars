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
