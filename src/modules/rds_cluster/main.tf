resource "aws_rds_cluster" "main" {
  #  TODO: Add ability to reference source_cluster_resource_id and source_cluster_identifier in restore_to_point_in_time block with data source
  engine                      = var.settings.engine
  cluster_identifier          = try(var.settings.cluster_identifier, null)
  cluster_identifier_prefix   = try(var.settings.cluster_identifier_prefix, null)
  cluster_scalability_type    = try(var.settings.cluster_scalability_type, null)
  region                      = try(var.settings.region, null)
  allocated_storage           = try(var.settings.allocated_storage, null)
  allow_major_version_upgrade = try(var.settings.allow_major_version_upgrade, null)
  apply_immediately           = try(var.settings.apply_immediately, null)
  availability_zones          = try(var.settings.availability_zones, null)
  backtrack_window            = try(var.settings.backtrack_window, null)
  backup_retention_period     = try(var.settings.backup_retention_period, null)
  ca_certificate_identifier   = try(var.settings.ca_certificate_identifier, null)
  copy_tags_to_snapshot       = try(var.settings.copy_tags_to_snapshot, null)
  database_insights_mode      = try(var.settings.database_insights_mode, null)
  database_name               = try(var.settings.database_name, null)
  db_cluster_instance_class   = try(var.settings.db_cluster_instance_class, null)
  # db_cluster_parameter_group_name      = try(var.settings.db_cluster_parameter_group_name, null)
  # db_instance_parameter_group_name     = try(var.settings.db_instance_parameter_group_name, null)
  # db_subnet_group_name                  = local.db_subnet_group_name
  # db_system_id                     = try(var.settings.db_system_id, null)
  # iam_roles                             = try(var.settings.iam_roles, null)
  # performance_insights_kms_key_id       = local.performance_insights_kms_key_id
  # master_user_secret_kms_key_id         = local.master_user_secret_kms_key_id
  # kms_key_id                            = local.kms_key_id
  # domain_iam_role_name                  = local.domain_iam_role_name
  # domain                                = local.domain
  # vpc_security_group_ids                = local.vpc_security_group_ids
  # tags                                  = local.tags
  delete_automated_backups              = try(var.settings.delete_automated_backups, null)
  deletion_protection                   = try(var.settings.deletion_protection, null)
  enable_global_write_forwarding        = try(var.settings.enable_global_write_forwarding, null)
  enable_http_endpoint                  = try(var.settings.enable_http_endpoint, null)
  enable_local_write_forwarding         = try(var.settings.enable_local_write_forwarding, null)
  enabled_cloudwatch_logs_exports       = try(var.settings.enabled_cloudwatch_logs_exports, null)
  engine_mode                           = try(var.settings.engine_mode, null)
  engine_lifecycle_support              = try(var.settings.engine_lifecycle_support, null)
  engine_version                        = try(var.settings.engine_version, null)
  final_snapshot_identifier             = try(var.settings.final_snapshot_identifier, null)
  global_cluster_identifier             = try(var.settings.global_cluster_identifier, null)
  iam_database_authentication_enabled   = try(var.settings.iam_database_authentication_enabled, null)
  manage_master_user_password           = try(var.settings.manage_master_user_password, null)
  master_password                       = try(var.settings.master_password, null)
  master_password_wo                    = try(var.settings.master_password_wo, null)
  master_password_wo_version            = try(var.settings.master_password_wo_version, null)
  master_username                       = try(var.settings.master_username, null)
  monitoring_interval                   = try(var.settings.monitoring_interval, null)
  monitoring_role_arn                   = local.monitoring_role_arn
  network_type                          = try(var.settings.network_type, null)
  performance_insights_enabled          = try(var.settings.performance_insights_enabled, null)
  performance_insights_retention_period = try(var.settings.performance_insights_retention_period, null)
  port                                  = try(var.settings.port, null)
  preferred_backup_window               = try(var.settings.preferred_backup_window, null)
  preferred_maintenance_window          = try(var.settings.preferred_maintenance_window, null)
  replication_source_identifier         = try(var.settings.replication_source_identifier, null)
  skip_final_snapshot                   = try(var.settings.skip_final_snapshot, null)
  snapshot_identifier                   = try(var.settings.snapshot_identifier, null)
  source_region                         = try(var.settings.source_region, null)
  storage_encrypted                     = try(var.settings.storage_encrypted, null)
  storage_type                          = try(var.settings.storage_type, null)
  iops                                  = try(var.settings.iops, null)

  dynamic "restore_to_point_in_time" {
    for_each = can(var.settings.restore_to_point_in_time) ? [1] : []
    content {
      source_cluster_identifier  = try(var.settings.restore_to_point_in_time.source_cluster_identifier, null)
      source_cluster_resource_id = try(var.settings.restore_to_point_in_time.source_cluster_resource_id, null)
      restore_type               = try(var.settings.restore_to_point_in_time.restore_type, null)
      use_latest_restorable_time = try(var.settings.restore_to_point_in_time.use_latest_restorable_time, null)
      restore_to_time            = try(var.settings.restore_to_point_in_time.restore_to_time, null)
    }
  }

  dynamic "scaling_configuration" {
    for_each = can(var.settings.scaling_configuration) ? [1] : []
    content {
      auto_pause               = try(var.settings.scaling_configuration.auto_pause, null)
      max_capacity             = try(var.settings.scaling_configuration.max_capacity, null)
      min_capacity             = try(var.settings.scaling_configuration.min_capacity, null)
      seconds_before_timeout   = try(var.settings.scaling_configuration.seconds_before_timeout, null)
      seconds_until_auto_pause = try(var.settings.scaling_configuration.seconds_until_auto_pause, null)
      timeout_action           = try(var.settings.scaling_configuration.timeout_action, null)
    }
  }

  dynamic "serverlessv2_scaling_configuration" {
    for_each = can(var.settings.serverlessv2_scaling_configuration) ? [1] : []
    content {
      max_capacity             = var.settings.serverlessv2_scaling_configuration.max_capacity
      min_capacity             = var.settings.serverlessv2_scaling_configuration.min_capacity
      seconds_until_auto_pause = try(var.settings.serverlessv2_scaling_configuration.seconds_until_auto_pause, null)
    }
  }

  dynamic "s3_import" {
    for_each = can(var.settings.s3_import) ? [1] : []
    content {
      bucket_name = try(
        var.resources.s3_buckets[var.settings.s3_import.bucket_ref].name,
        var.settings.s3_import.bucket_name
      )
      ingestion_role = try(
        var.resources.iam_roles[var.settings.s3_import.ingestion_role_ref].id,
        var.settings.s3_import.ingestion_role
      )
      source_engine         = try(var.settings.s3_import.source_engine, "mysql")
      source_engine_version = try(var.settings.s3_import.source_engine_version, "5.6")
      bucket_prefix         = try(var.settings.s3_import.bucket_prefix, null)
    }
  }
}
