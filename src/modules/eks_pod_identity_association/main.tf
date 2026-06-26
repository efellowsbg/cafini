resource "aws_eks_pod_identity_association" "main" {
  cluster_name    = local.cluster_name
  namespace       = var.settings.namespace
  service_account = var.settings.service_account
  role_arn        = local.role_arn
  tags            = local.tags
}
