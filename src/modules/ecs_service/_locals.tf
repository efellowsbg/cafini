locals {
  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )

  cluster_arn = try(
    var.resources.ecs_clusters[var.settings.cluster_ref].arn,
    try(var.settings.cluster_arn, null)
  )

  # task_definition_arn = try(
  #   var.resources.ecs_task_definitions[var.settings.task_definition_ref].arn,
  #   try(var.settings.task_definition, null)
  # )

  iam_role_arn = try(
    var.resources.iam_roles[var.settings.iam_role_ref].arn,
    try(var.settings.iam_role, null)
  )

  subnet_ids = try(
    var.resources.vpcs[split("/", ref)[0]].subnets[split("/", ref)[1]].id, var.settings.subnet_ids
  )

  security_group_ids = try(
    [for ref in try(var.settings.security_group_refs, []) :
      var.resources.security_groups[ref].id
    ],
    try(var.settings.security_group_ids, null)
  )
}
