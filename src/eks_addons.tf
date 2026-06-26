module "eks_addons" {
  source   = "./modules/eks_addon"
  for_each = var.eks_addons

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    eks_clusters = module.eks_clusters
    iam_roles    = module.iam_roles
  }
}

module "eks_pod_identity_associations" {
  source   = "./modules/eks_pod_identity_association"
  for_each = var.eks_pod_identity_associations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    eks_clusters = module.eks_clusters
    iam_roles    = module.iam_roles
  }
}

module "eks_access_entries" {
  source   = "./modules/eks_access_entry"
  for_each = var.eks_access_entries

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    eks_clusters = module.eks_clusters
    iam_roles    = module.iam_roles
    iam_users    = module.iam_users
  }
}

module "eks_access_policy_associations" {
  source   = "./modules/eks_access_policy_association"
  for_each = var.eks_access_policy_associations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    eks_clusters = module.eks_clusters
    iam_roles    = module.iam_roles
    iam_users    = module.iam_users
  }
}
