iam_roles = {
  role_test = {
    name                     = "test-role"
    description              = "Example IAM role"
    assume_role_policy_ref   = "policy_assume_test"
    permissions_boundary_ref = "policy_boundary_test"
    max_session_duration     = 3600
  }
}
