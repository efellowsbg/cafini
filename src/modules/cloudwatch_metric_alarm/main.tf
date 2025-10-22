resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name                            = var.settings.alarm_name
  comparison_operator                   = var.settings.comparison_operator
  evaluation_periods                    = var.settings.evaluation_periods
  insufficient_data_actions             = local.insufficient_data_actions
  ok_actions                            = local.ok_actions
  region                                = try(var.settings.region, null)
  metric_name                           = try(var.settings.metric_name, null)
  namespace                             = try(var.settings.namespace, null)
  period                                = try(var.settings.period, null)
  statistic                             = try(var.settings.statistic, null)
  threshold                             = try(var.settings.threshold, null)
  threshold_metric_id                   = try(var.settings.threshold_metric_id, null)
  actions_enabled                       = try(var.settings.actions_enabled, null)
  alarm_actions                         = try(var.settings.alarm_actions, null)
  alarm_description                     = try(var.settings.alarm_description, null)
  datapoints_to_alarm                   = try(var.settings.datapoints_to_alarm, null)
  dimensions                            = try(var.settings.dimensions, null)
  extended_statistic                    = try(var.settings.extended_statistic, null)
  treat_missing_data                    = try(var.settings.treat_missing_data, "missing")
  unit                                  = try(var.settings.unit, null)
  evaluate_low_sample_count_percentiles = try(var.settings.evaluate_low_sample_count_percentiles, null)
  tags                                  = local.tags

  dynamic "metric_query" {
    for_each = try(var.settings.metric_querys, {})
    content {
      id          = metric_querys.value.id
      account_id  = try(metric_query.value.account_id, null)
      expression  = try(metric_query.value.expression, null)
      label       = try(metric_query.value.label, null)
      period      = try(metric_query.value.period, null)
      return_data = try(metric_query.value.return_data, null)

      dynamic "metric" {
        for_each = try(var.settings.metric_querys.metrics, {})
        content {
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          dimensions  = try(metric.value.dimensions, null)
          unit        = try(metric.value.unit, null)
        }
      }
    }
  }
}
