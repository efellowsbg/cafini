iam_group_policy_attachments = {
  group_attach_test = {
    group_ref  = "group_test"
    policy_ref = "policy_assume_test"
  }
}

# pre-requisites
iam_groups = {
  group_test = {
    name = "group-test"
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
