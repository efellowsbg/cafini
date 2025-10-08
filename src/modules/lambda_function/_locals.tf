locals {
  role_arn = try(
    var.resources.iam_roles[var.settings.role_ref].arn,
    try(var.settings.role_arn, null)
  )

  s3_bucket = try(
    var.resources.s3_buckets[var.settings.s3_bucket_ref].id,
    try(var.settings.s3_bucket, null)
  )

  subnet_ids = length(try(var.settings.vpc_config.subnet_refs, [])) > 0 ? [
    for ref in var.settings.vpc_config.subnet_refs :
    var.resources.vpcs[split("/", ref)[0]].subnets[split("/", ref)[1]].id
  ] : try(var.settings.vpc_config.subnet_ids, null)

  security_group_ids = length(try(var.settings.vpc_config.security_group_refs, [])) > 0 ? [
    for ref in var.settings.vpc_config.security_group_refs :
    var.resources.security_groups[ref].id
  ] : try(var.settings.vpc_config.security_group_ids, null)

  log_group_name = try(
    var.resources.cloudwatch_log_groups[var.settings.log_group_ref].name,
    try(var.settings.logging_config.log_group, null)
  )

  file_system_arn = try(
    var.resources.efs_access_points[var.settings.file_system_ref].arn,
    try(var.settings.file_system_config.arn, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
