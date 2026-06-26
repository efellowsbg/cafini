resource "aws_eks_access_policy_association" "main" {
  cluster_name  = local.cluster_name
  principal_arn = local.principal_arn
  policy_arn    = var.settings.policy_arn

  access_scope {
    type       = var.settings.access_scope.type
    namespaces = try(var.settings.access_scope.namespaces, null)
  }
}
