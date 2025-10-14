resource "aws_eks_cluster" "main" {
  name     = var.settings.name
  version  = try(var.settings.version, null)
  role_arn = local.role_arn

  vpc_config {
    subnet_ids              = local.subnet_ids
    security_group_ids      = try(local.security_group_ids, null)
    endpoint_private_access = try(var.settings.vpc_config.endpoint_private_access, null)
    endpoint_public_access  = try(var.settings.vpc_config.endpoint_public_access, null)
    public_access_cidrs     = try(var.settings.vpc_config.public_access_cidrs, null)
  }

  dynamic "access_config" {
    for_each = can(var.settings.access_config) ? [1] : []
    content {
      authentication_mode = try(var.settings.access_config.authentication_mode, null)
      bootstrap_cluster_creator_admin_permissions = try(
        var.settings.access_config.bootstrap_cluster_creator_admin_permissions, null
      )
    }
  }

  dynamic "encryption_config" {
    for_each = can(var.settings.encryption_config) ? [1] : []
    content {
      provider {
        key_arn = try(
          var.resources.kms_keys[var.settings.encryption_config.provider.kms_key_ref].arn,
          try(var.settings.encryption_config.provider.key_arn, null)
        )
      }
      resources = try(var.settings.encryption_config.resources, null)
    }
  }

  dynamic "enabled_cluster_log_types" {
    for_each = can(var.settings.enabled_cluster_log_types) ? [1] : []
    content {}
  }

  region = try(var.settings.region, null)
  tags   = local.tags
}
