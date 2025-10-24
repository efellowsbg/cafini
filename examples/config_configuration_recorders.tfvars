config_configuration_recorders = {
  recorder_example = {
    name         = "example-recorder"
    role_arn_ref = "role_test"
    recording_group = {
      all_supported                 = true
      include_global_resource_types = false
      resource_types                = []
    }
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
