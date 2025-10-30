module "iam_policy_attachments" {
  source   = "./modules/policy_attachments/iam_policy_attachment"
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

module "iam_user_policy_attachments" {
  source   = "./modules/policy_attachments/iam_user_policy_attachment"
  for_each = var.iam_user_policy_attachments

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_users    = module.iam_users
    iam_policies = module.iam_policies
  }
}

module "iam_group_policy_attachments" {
  source   = "./modules/policy_attachments/iam_group_policy_attachment"
  for_each = var.iam_group_policy_attachments

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_groups   = module.iam_groups
    iam_policies = module.iam_policies
  }
}

module "iam_role_policy_attachments" {
  source   = "./modules/policy_attachments/iam_role_policy_attachment"
  for_each = var.iam_role_policy_attachments

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_roles    = module.iam_roles
    iam_policies = module.iam_policies
  }
}
