resource "aws_db_instance" "main" {
  instance_class                        = var.settings.instance_class
  region                                = try(var.settings.region, null)
  allocated_storage                     = try(var.settings.allocated_storage, null)
  allow_major_version_upgrade           = try(var.settings.allow_major_version_upgrade, null)
  domain_ou                             = try(var.settings.domain_ou, null)
  engine                                = try(var.settings.engine, null)
  enabled_cloudwatch_logs_exports       = try(var.settings.enabled_cloudwatch_logs_exports, null)
  engine_lifecycle_support              = try(var.settings.engine_lifecycle_support, null)
  apply_immediately                     = try(var.settings.apply_immediately, null)
  auto_minor_version_upgrade            = try(var.settings.auto_minor_version_upgrade, null)
  availability_zone                     = try(var.settings.availability_zone, null)
  backup_retention_period               = try(var.settings.backup_retention_period, null)
  backup_target                         = try(var.settings.backup_target, null)
  backup_window                         = try(var.settings.backup_window, null)
  character_set_name                    = try(var.settings.character_set_name, null)
  copy_tags_to_snapshot                 = try(var.settings.copy_tags_to_snapshot, null)
  custom_iam_instance_profile           = try(var.settings.custom_iam_instance_profile, null)
  database_insights_mode                = try(var.settings.database_insights_mode, null)
  db_name                               = try(var.settings.db_name, null)
  identifier                            = try(var.settings.identifier, null)
  identifier_prefix                     = try(var.settings.identifier_prefix, null)
  dedicated_log_volume                  = try(var.settings.dedicated_log_volume, null)
  delete_automated_backups              = try(var.settings.delete_automated_backups, null)
  deletion_protection                   = try(var.settings.deletion_protection, null)
  final_snapshot_identifier             = try(var.settings.final_snapshot_identifier, null)
  iam_database_authentication_enabled   = try(var.settings.iam_database_authentication_enabled, null)
  iops                                  = try(var.settings.iops, null)
  license_model                         = try(var.settings.license_model, null)
  maintenance_window                    = try(var.settings.maintenance_window, null)
  manage_master_user_password           = try(var.settings.manage_master_user_password, null)
  max_allocated_storage                 = try(var.settings.max_allocated_storage, null)
  monitoring_interval                   = try(var.settings.monitoring_interval, null)
  multi_az                              = try(var.settings.multi_az, null)
  nchar_character_set_name              = try(var.settings.nchar_character_set_name, null)
  network_type                          = try(var.settings.network_type, null)
  username                              = try(var.settings.username, null)
  password                              = try(var.settings.password, null)
  password_wo                           = try(var.settings.password_wo, null)
  password_wo_version                   = try(var.settings.password_wo_version, null)
  performance_insights_enabled          = try(var.settings.performance_insights_enabled, null)
  performance_insights_retention_period = try(var.settings.performance_insights_retention_period, null)
  port                                  = try(var.settings.port, null)
  publicly_accessible                   = try(var.settings.publicly_accessible, null)
  replica_mode                          = try(var.settings.replica_mode, null)
  replicate_source_db                   = try(var.settings.replicate_source_db, null)
  upgrade_storage_config                = try(var.settings.upgrade_storage_config, null)
  skip_final_snapshot                   = try(var.settings.skip_final_snapshot, null)
  snapshot_identifier                   = try(var.settings.snapshot_identifier, null)
  storage_encrypted                     = try(var.settings.storage_encrypted, null)
  storage_type                          = try(var.settings.storage_type, null)
  storage_throughput                    = try(var.settings.storage_throughput, null)
  timezone                              = try(var.settings.timezone, null)
  customer_owned_ip_enabled             = try(var.settings.customer_owned_ip_enabled, null)
  domain_fqdn                           = try(var.settings.domain_fqdn, null)
  domain_auth_secret_arn                = local.domain_auth_secret_arn
  domain_iam_role_name                  = local.domain_iam_role_name
  domain                                = local.domain
  domain_dns_ips                        = local.domain_dns_ips
  option_group_name                     = local.option_group_name
  parameter_group_name                  = local.parameter_group_name
  ca_cert_identifier                    = try(var.settings.ca_cert_identifier, null)
  db_subnet_group_name                  = try(var.settings.db_subnet_group_name, null)
  master_user_secret_kms_key_id         = local.master_user_secret_kms_key_id
  monitoring_role_arn                   = local.monitoring_role_arn
  performance_insights_kms_key_id       = local.performance_insights_kms_key_id
  vpc_security_group_ids                = local.vpc_security_group_ids
  kms_key_id                            = local.kms_key_id
  tags                                  = local.tags

  dynamic "blue_green_update" {
    for_each = can(var.settings.blue_green_update) ? [1] : []
    content {
      enabled = try(var.settings.blue_green_update.enabled, null)
    }
  }

  dynamic "restore_to_point_in_time" {
    for_each = can(var.settings.restore_to_point_in_time) ? [1] : []
    content {
      restore_time                             = try(var.settings.restore_to_point_in_time.restore_time, null)
      source_db_instance_automated_backups_arn = try(var.settings.restore_to_point_in_time.source_db_instance_automated_backups_arn, null)
      use_latest_restorable_time               = try(var.settings.restore_to_point_in_time.use_latest_restorable_time, null)
      source_db_instance_identifier            = local.source_db_instance_identifier
      source_dbi_resource_id                   = local.source_dbi_resource_id
    }
  }

  dynamic "s3_import" {
    for_each = can(var.settings.s3_import) ? [1] : []
    content {
      bucket_name           = var.settings.s3_import.bucket_name
      ingestion_role        = var.settings.s3_import.ingestion_role
      source_engine         = var.settings.s3_import.source_engine
      source_engine_version = var.settings.s3_import.source_engine_version
      bucket_prefix         = try(var.settings.s3_import.bucket_prefix, null)
    }
  }
}
