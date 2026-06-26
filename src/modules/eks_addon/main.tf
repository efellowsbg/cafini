resource "aws_eks_addon" "main" {
  cluster_name                = local.cluster_name
  addon_name                  = var.settings.addon_name
  addon_version               = try(var.settings.addon_version, null)
  configuration_values        = try(var.settings.configuration_values, null)
  preserve                    = try(var.settings.preserve, null)
  resolve_conflicts_on_create = try(var.settings.resolve_conflicts_on_create, null)
  resolve_conflicts_on_update = try(var.settings.resolve_conflicts_on_update, null)
  service_account_role_arn    = local.service_account_role_arn
  tags                        = local.tags
}
