locals {
  db_subnet_group_name = try(
    var.resources.db_subnet_groups[var.settings.db_subnet_group_ref].name,
    try(var.settings.db_subnet_group_name, null)
  )

  db_cluster_parameter_group_name = try(
    var.resources.db_parameter_groups[var.settings.db_cluster_parameter_group_ref].name,
    try(var.settings.db_cluster_parameter_group_name, null)
  )

  db_instance_parameter_group_name = try(
    var.resources.db_parameter_groups[var.settings.db_instance_parameter_group_ref].name,
    try(var.settings.db_instance_parameter_group_name, null)
  )

  domain = try(
    var.resources.directory_service_directories[var.settings.domain_ref].id,
    try(var.settings.domain, null)
  )

  vpc_security_group_ids = (
    length(try(var.settings.vpc_security_group_refs, [])) > 0 ?
    [for ref in var.settings.vpc_security_group_refs : var.resources.security_groups[ref].id] :
    try(var.settings.vpc_security_group_ids, null)
  )

  domain_iam_role_name = try(
    var.resources.iam_roles[var.settings.domain_iam_role_ref].name,
    try(var.settings.domain_iam_role_name, null)
  )

  monitoring_role_arn = try(
    var.resources.iam_roles[var.settings.monitoring_role_ref].arn,
    try(var.settings.monitoring_role_arn, null)
  )

  iam_roles = (
    length(try(var.settings.iam_roles, [])) > 0 ?
    [for ref in var.settings.iam_roles : var.resources.iam_roles[ref].id] :
    try(var.settings.iam_roles, null)
  )

  master_user_secret_kms_key_id = try(
    var.resources.key_pairs[var.settings.master_user_secret_kms_key_ref].id,
    try(var.settings.master_user_secret_kms_key_id, null)
  )

  kms_key_id = try(
    var.resources.key_pairs[var.settings.kms_key_ref].key_name,
    try(var.settings.kms_key_id, null)
  )

  performance_insights_kms_key_id = try(
    var.resources.key_pairs[var.settings.performance_insights_kms_key_ref].id,
    try(var.settings.performance_insights_kms_key_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
