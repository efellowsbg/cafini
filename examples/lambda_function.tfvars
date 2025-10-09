lambda_functions = {
  lambda_test = {
    function_name = "lambda-test"
    description   = "Test Lambda function"
    role_ref      = "role_test"
    handler       = "index.handler"
    runtime       = "python3.12"
    filename      = "function.zip"
    timeout       = 15
    memory_size   = 256

    logging_config = {
      log_format            = "JSON"
      application_log_level = "INFO"
      system_log_level      = "WARN"
      log_group_ref         = "lambda_log_group"
    }

    environment = {
      variables = {
        ENVIRONMENT = "dev"
      }
    }

    tags = {
      Component = "Lambda"
    }
  }
}
