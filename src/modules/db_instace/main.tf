resource "aws_db_instance" "main" {
  instance_class              = var.settings.instance_class
  region                      = try(var.settings.region, null)
  allocated_storage           = try(var.settings.allocated_storage, null)
  allow_major_version_upgrade = try(var.settings.allow_major_version_upgrade, null)
  domain_auth_secret_arn      = try(var.settings.domain_auth_secret_arn, null)
  domain_dns_ips              = try(var.settings.domain_dns_ips, null)
  domain_ou                   = try(var.settings.domain_ou, null)
  engine                      = try(var.settings.engine, null)
  apply_immediately           = try(var.settings.apply_immediately, null)
  auto_minor_version_upgrade  = try(var.settings.auto_minor_version_upgrade, null)
  availability_zone           = try(var.settings.availability_zone, null)
  backup_retention_period     = try(var.settings.backup_retention_period, null)
  backup_target               = try(var.settings.backup_target, null)
  backup_window               = try(var.settings.backup_window, null)
  ca_cert_identifier          = try(var.settings.ca_cert_identifier, null)
  character_set_name          = try(var.settings.character_set_name, null)
  copy_tags_to_snapshot       = try(var.settings.copy_tags_to_snapshot, null)
  custom_iam_instance_profile = try(var.settings.custom_iam_instance_profile, null)
  database_insights_mode      = try(var.settings.database_insights_mode, null)
  db_name                     = try(var.settings.db_name, null)
  db_subnet_group_name        = try(var.settings.db_subnet_group_name, null)
  dedicated_log_volume        = try(var.settings.dedicated_log_volume, null)

  dynamic "blue_green_update" {
    for_each = can(var.settings.blue_green_update) ? [1] : []
    content {
      enabled = try(var.settings.blue_green_update.enabled, null)
    }
  }

  # dynamic "metric_query" {
  #   for_each = try(var.settings.metric_querys, {})
  #   content {
  #     id          = metric_query.value.id
  #     account_id  = try(metric_query.value.account_id, null)
  #     expression  = try(metric_query.value.expression, null)
  #     label       = try(metric_query.value.label, null)
  #     period      = try(metric_query.value.period, null)
  #     return_data = try(metric_query.value.return_data, null)

  #     dynamic "metric" {
  #       for_each = try(var.settings.metric_query.metrics, {})
  #       content {
  #         metric_name = metric.value.metric_name
  #         namespace   = metric.value.namespace
  #         period      = metric.value.period
  #         stat        = metric.value.stat
  #         dimensions  = try(metric.value.dimensions, null)
  #         unit        = try(metric.value.unit, null)
  #       }
  #     }
  #   }
  # }
}
