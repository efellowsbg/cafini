resource "aws_db_instance" "main" {
  instance_class         = var.settings.instance_class
  region                 = try(var.settings.region, null)
  domain_auth_secret_arn = try(var.settings.domain_auth_secret_arn, null)
  domain_dns_ips         = try(var.settings.domain_dns_ips, null)
  domain_ou              = try(var.settings.domain_ou, null)
  engine                 = try(var.settings.engine, null)

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
