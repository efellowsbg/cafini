resource "aws_rds_cluster_instance" "main" {
  engine                                = var.settings.engine
  instance_class                        = var.settings.instance_class
  cluster_identifier                    = local.cluster_identifier
  region                                = try(var.settings.region, null)
  apply_immediately                     = try(var.settings.apply_immediately, null)
  auto_minor_version_upgrade            = try(var.settings.auto_minor_version_upgrade, null)
  availability_zone                     = try(var.settings.availability_zone, null)
  ca_cert_identifier                    = try(var.settings.ca_cert_identifier, null)
  copy_tags_to_snapshot                 = try(var.settings.copy_tags_to_snapshot, null)
  engine_version                        = try(var.settings.engine_version, null)
  force_destroy                         = try(var.settings.force_destroy, null)
  identifier_prefix                     = try(var.settings.identifier_prefix, null)
  monitoring_interval                   = try(var.settings.monitoring_interval, null)
  performance_insights_enabled          = try(var.settings.performance_insights_enabled, null)
  performance_insights_retention_period = try(var.settings.performance_insights_retention_period, null)
  preferred_backup_window               = try(var.settings.preferred_backup_window, null)
  preferred_maintenance_window          = try(var.settings.preferred_maintenance_window, null)
  promotion_tier                        = try(var.settings.promotion_tier, null)
  publicly_accessible                   = try(var.settings.publicly_accessible, null)
  custom_iam_instance_profile           = local.custom_iam_instance_profile
  db_parameter_group_name               = local.db_parameter_group_name
  db_subnet_group_name                  = local.db_subnet_group_name
  monitoring_role_arn                   = local.monitoring_role_arn
  performance_insights_kms_key_id       = local.performance_insights_kms_key_id
  tags                                  = local.tags
}
