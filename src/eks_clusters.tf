module "eks_clusters" {
  source   = "./modules/eks_cluster"
  for_each = var.eks_clusters

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    kms_keys       = module.kms_keys
    vpc_id         = module.vpcs
    iam_roles      = module.iam_roles
    security_group = module.security_groups
  }
}
