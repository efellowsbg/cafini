iam_roles = {
  role_test = {
    name                     = "test-role"
    description              = "Example IAM role"
    assume_principals        = ["ec2.amazonaws.com"]
    permissions_boundary_ref = "policy_boundary_test"
    max_session_duration     = 3600
  }
}
