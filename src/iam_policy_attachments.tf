module "iam_policy_attachments" {
  source   = "./modules/_security/iam_policy_attachment"
  for_each = var.iam_policy_attachments

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_policies = module.iam_policies
    iam_roles    = module.iam_roles
    iam_users    = module.iam_users
    iam_groups   = module.iam_groups
  }
}
