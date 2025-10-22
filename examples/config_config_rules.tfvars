config_config_rules = {
  cc_rule_test = {
    name        = "cc-rule-test"
    description = "Test Config Rule"

    source = {
      owner                 = "CUSTOM_LAMBDA"
      source_identifier_ref = "lambda_test"
    }

    input_parameters = {
      ExampleParameter = "ExampleValue"
    }

    maximum_execution_frequency = "TwentyFour_Hours"

    tags = {
      Component = "Config"
    }
  }
}

# pre-requisites
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
      log_group_ref         = "clg_test"
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
