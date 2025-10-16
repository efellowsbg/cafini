locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  cluster_name = try(
    var.resources.eks_clusters[var.settings.cluster_ref].name, var.settings.cluster_name
  )

  node_role_arn = try(
    var.resources.iam_roles[var.settings.node_role_ref].arn, var.settings.node_role_arn
  )

  subnet_ids = try(
    var.resources.vpcs[split("/", var.settings.subnet_ref)[0]].subnets[split("/", var.settings.subnet_ref)[1]].id
  )

  launch_template_id = try(
    var.resources.launch_templates[var.settings.launch_template_ref].id,
    try(var.settings.launch_template.id, null)
  )

  launch_template_name = try(
    var.resources.launch_templates[var.settings.launch_template_ref].name,
    try(var.settings.launch_template.name, null)
  )

  launch_template_version = try(
    var.resources.launch_templates[var.settings.launch_template_ref].default_version,
    try(var.settings.launch_template.version, null)
  )

  remote_access_security_group_ids = try(
    [for ref in try(var.settings.remote_access.source_security_group_refs, []) :
      var.resources.security_groups[ref].id
    ],
    try(var.settings.remote_access.source_security_group_ids, null)
  )

  scaling_config     = var.settings.scaling_config
  update_config      = try(var.settings.update_config, null)
  launch_template    = try(var.settings.launch_template, null)
  remote_access      = try(var.settings.remote_access, null)
  node_repair_config = try(var.settings.node_repair_config, null)
}
