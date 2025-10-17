resource "aws_budgets_budget" "main" {
  name             = try(var.settings.name, null)
  name_prefix      = try(var.settings.name_prefix, null)
  account_id       = try(var.settings.account_id, null)
  budget_type      = var.settings.budget_type
  time_unit        = var.settings.time_unit
  limit_amount     = try(var.settings.limit_amount, null)
  limit_unit       = try(var.settings.limit_unit, null)
  billing_view_arn = try(var.settings.billing_view_arn, null)

  time_period_start = try(var.settings.time_period_start, null)
  time_period_end   = try(var.settings.time_period_end, null)

  tags = local.tags

  dynamic "auto_adjust_data" {
    for_each = can(var.settings.auto_adjust_data) ? [1] : []
    content {
      auto_adjust_type = var.settings.auto_adjust_data.auto_adjust_type

      dynamic "historical_options" {
        for_each = can(var.settings.auto_adjust_data.historical_options) ? [1] : []
        content {
          budget_adjustment_period   = var.settings.auto_adjust_data.historical_options.budget_adjustment_period
          lookback_available_periods = try(var.settings.auto_adjust_data.historical_options.lookback_available_periods, null)
        }
      }

      last_auto_adjust_time = try(var.settings.auto_adjust_data.last_auto_adjust_time, null)
    }
  }

  dynamic "cost_types" {
    for_each = can(var.settings.cost_types) ? [1] : []
    content {
      include_credit             = try(var.settings.cost_types.include_credit, null)
      include_discount           = try(var.settings.cost_types.include_discount, null)
      include_other_subscription = try(var.settings.cost_types.include_other_subscription, null)
      include_recurring          = try(var.settings.cost_types.include_recurring, null)
      include_refund             = try(var.settings.cost_types.include_refund, null)
      include_subscription       = try(var.settings.cost_types.include_subscription, null)
      include_support            = try(var.settings.cost_types.include_support, null)
      include_tax                = try(var.settings.cost_types.include_tax, null)
      include_upfront            = try(var.settings.cost_types.include_upfront, null)
      use_amortized              = try(var.settings.cost_types.use_amortized, null)
      use_blended                = try(var.settings.cost_types.use_blended, null)
    }
  }

  dynamic "cost_filter" {
    for_each = try(var.settings.cost_filter, {})
    content {
      name   = cost_filter.value.name
      values = cost_filter.value.values
    }
  }

  dynamic "notification" {
    for_each = try(var.settings.notification, {})
    content {
      comparison_operator        = notification.value.comparison_operator
      threshold                  = notification.value.threshold
      threshold_type             = notification.value.threshold_type
      notification_type          = notification.value.notification_type
      subscriber_email_addresses = try(notification.value.subscriber_email_addresses, null)
      subscriber_sns_topic_arns  = try(notification.value.subscriber_sns_topic_arns, null)
    }
  }

  dynamic "planned_limit" {
    for_each = try(var.settings.planned_limit, {})
    content {
      start_time = planned_limit.value.start_time
      amount     = planned_limit.value.amount
      unit       = planned_limit.value.unit
    }
  }
}
