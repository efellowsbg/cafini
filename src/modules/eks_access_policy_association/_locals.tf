locals {
  cluster_name = try(
    var.resources.eks_clusters[var.settings.cluster_ref].name,
    try(var.settings.cluster_name, null)
  )

  principal_arn = try(
    var.resources.iam_roles[var.settings.principal_role_ref].arn,
    try(var.resources.iam_users[var.settings.principal_user_ref].arn, try(var.settings.principal_arn, null))
  )

}
