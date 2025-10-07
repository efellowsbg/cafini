iam_policy_attachments = {
  attach_ec2 = {
    name       = "attach-ec2-policy"
    policy_ref = "policy_assume_test"
    role_refs  = ["role_test"]
  }
}
