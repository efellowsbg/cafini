resource "aws_eks_node_group" "main" {
  cluster_name    = local.cluster_name
  node_group_name = try(var.settings.node_group_name, null)
  node_role_arn   = local.node_role_arn
  subnet_ids      = local.subnet_ids

  ami_type             = try(var.settings.ami_type, null)
  capacity_type        = try(var.settings.capacity_type, null)
  disk_size            = try(var.settings.disk_size, null)
  force_update_version = try(var.settings.force_update_version, null)
  instance_types       = try(var.settings.instance_types, null)
  labels               = try(var.settings.labels, null)
  release_version      = try(var.settings.release_version, null)
  version              = try(var.settings.version, null)
  region               = try(var.settings.region, null)
  tags                 = local.tags

  scaling_config {
    desired_size = var.settings.scaling_config.desired_size
    max_size     = var.settings.scaling_config.max_size
    min_size     = var.settings.scaling_config.min_size
  }

  dynamic "update_config" {
    for_each = can(var.settings.update_config) ? [1] : []
    content {
      max_unavailable            = try(var.settings.update_config.max_unavailable, null)
      max_unavailable_percentage = try(var.settings.update_config.max_unavailable_percentage, null)
    }
  }

  dynamic "launch_template" {
    for_each = can(var.settings.launch_template) || can(var.settings.launch_template_ref) ? [1] : []
    content {
      id      = try(local.launch_template_id, null)
      name    = try(local.launch_template_name, null)
      version = local.launch_template_version
    }
  }

  dynamic "remote_access" {
    for_each = can(var.settings.remote_access) ? [1] : []
    content {
      ec2_ssh_key               = try(var.settings.remote_access.ec2_ssh_key, null)
      source_security_group_ids = try(local.remote_access_security_group_ids, null)
    }
  }

  dynamic "node_repair_config" {
    for_each = can(var.settings.node_repair_config) ? [1] : []
    content {
      enabled = var.settings.node_repair_config.enabled
    }
  }

  dynamic "taint" {
    for_each = try(var.settings.taint, {})
    content {
      key    = taint.value.key
      value  = try(taint.value.value, null)
      effect = taint.value.effect
    }
  }

  lifecycle {
    ignore_changes = try(var.settings.ignore_changes, {})
  }
}
