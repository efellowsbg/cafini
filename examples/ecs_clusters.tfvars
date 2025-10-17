ecs_clusters = {
  test_ecs = {
    name = "caf-ecs-cluster"

    configuration = {
      execute_command_configuration = {
        kms_key_ref = "kms_keys_test"
        logging     = "OVERRIDE"
        # log_configuration = {
        #   cloudwatch_ref = "ecs_logs"
        #   s3_bucket_ref  = "logs_bucket"
        # }
      }
      managed_storage_configuration = {
        kms_key_ref = "kms_keys_test"
      }
    }

    tags = {
      Environment = "dev"
    }
  }
}
