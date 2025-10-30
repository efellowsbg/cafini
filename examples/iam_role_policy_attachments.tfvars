iam_role_policy_attachments = {
  role_attach_test = {
    role_ref   = "role_test"
    policy_ref = "policy_assume_test"
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
