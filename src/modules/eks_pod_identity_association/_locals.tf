locals {
  cluster_name = try(
    var.resources.eks_clusters[var.settings.cluster_ref].name,
    try(var.settings.cluster_name, null)
  )

  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn,
    try(var.settings.role_arn, null)
  )

  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
