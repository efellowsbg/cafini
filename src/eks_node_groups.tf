module "eks_node_groups" {
  source = "./modules/eks_node_group"

  for_each = var.eks_node_groups

  settings        = each.value
  global_settings = var.global_settings

  resources = {
    eks_clusters     = module.eks_clusters
    iam_roles        = module.iam_roles
    vpcs             = module.vpcs
    launch_templates = module.launch_templates
    security_groups  = module.security_groups
  }


}
