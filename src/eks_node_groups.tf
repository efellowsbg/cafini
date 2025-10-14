module "eks_node_groups" {
  source = "./modules/eks_node_group"

  for_each = var.eks_node_groups

  settings = each.value

  resources = {
    eks_clusters     = module.eks_clusters.resources
    iam_roles        = module.iam_roles.resources
    vpcs             = module.vpcs.resources
    launch_templates = module.launch_templates.resources
    security_groups  = module.security_groups.resources
  }

  global_settings = var.global_settings
}
