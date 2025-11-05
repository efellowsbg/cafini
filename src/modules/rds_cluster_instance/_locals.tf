locals {
  cluster_identifier = try(
    var.resources.rds_clusters[var.settings.cluster_ref].identifier,
    var.settings.cluster_identifier
  )

  performance_insights_kms_key_id = try(
    var.resources.kms_keys[var.settings.performance_insights_kms_key_ref].arn,
    try(var.settings.performance_insights_kms_key_id, null)
  )

  custom_iam_instance_profile = try(
    var.resources.iam_instance_profiles[var.settings.custom_iam_instance_profile_ref].name,
    try(var.settings.custom_iam_instance_profile, null)
  )

  db_parameter_group_name = try(
    var.resources.db_parameter_groups[var.settings.parameter_group_ref].name,
    try(var.settings.db_parameter_group_name, null)
  )

  db_subnet_group_name = try(
    var.resources.db_subnet_groups[var.settings.db_subnet_group_ref].name,
    try(var.settings.db_subnet_group_name, null)
  )

  monitoring_role_arn = try(
    var.resources.iam_roles[var.settings.monitoring_role_ref].arn,
    try(var.settings.monitoring_role_arn, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
