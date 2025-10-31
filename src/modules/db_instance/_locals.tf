locals {
  domain_auth_secret_arn = try(
    var.resources.secretsmanager_secrets[var.settings.domain_auth_secret_ref].arn,
    try(var.settings.domain_auth_secret_arn, null)
  )

  db_subnet_group_name = ry(
    var.resources.db_subnet_groups[var.settings.db_subnet_group_ref].name,
    try(var.settings.db_subnet_group_name, null)
  )

  parameter_group_name = try(
    var.resources.db_parameter_groups[var.settings.parameter_group_ref].name,
    try(var.settings.parameter_group_name, null)
  )

  option_group_name = try(
    var.resources.db_option_groups[var.settings.option_group_ref].name,
    try(var.settings.option_group_name, null)
  )

  domain = try(
    var.resources.directory_service_directories[var.settings.domain_ref].id,
    try(var.settings.domain, null)
  )

  domain_dns_ips = try(
    var.resources.directory_service_directories[var.settings.domain_dns_ips_rf].dns_ip_addresses,
    try(var.settings.domain_dns_ips, null)
  )

  source_db_instance_identifier = try(
    var.resources.db_instances[var.settings.source_db_instance_identifier_ref].identifier,
    try(var.settings.source_db_instance_identifier, null)
  )

  source_dbi_resource_id = try(
    var.resources.db_instances[var.settings.source_dbi_resource_ref].id,
    try(var.settings.source_dbi_resource_id, null)
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
