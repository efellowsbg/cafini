iam_user_policy_attachments = {
  user_attach_test = {
    user_ref   = "user_test"
    policy_ref = "policy_assume_test"
  }
}

# pre-requisites
iam_users = {
  user_test = {
    name = "user-test"
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
