iam_policy_attachments = {
  policy_attach_test = {
    name       = "attach-ec2-policy"
    policy_ref = "policy_assume_test"
    role_refs  = ["role_test"]
  }
}
