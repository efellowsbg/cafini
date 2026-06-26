resource "aws_eks_access_entry" "main" {
  cluster_name      = local.cluster_name
  principal_arn     = local.principal_arn
  kubernetes_groups = try(var.settings.kubernetes_groups, null)
  type              = try(var.settings.type, null)
  user_name         = try(var.settings.user_name, null)
  tags              = local.tags
}
