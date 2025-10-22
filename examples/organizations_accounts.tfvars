organizations_accounts = {
  test_org_acc_1 = {
    name  = "cafini-test-account"
    email = "cafini.test01@example.com"

    # optional
    close_on_deletion          = false
    iam_user_access_to_billing = "ALLOW"
    role_name                  = "OrganizationAccountAccessRole"
  }
}
