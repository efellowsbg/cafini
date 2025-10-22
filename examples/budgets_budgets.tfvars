budgets_budgets = {
  test_budget = {
    name         = "monthly-cost-budget"
    budget_type  = "COST"
    time_unit    = "MONTHLY"
    limit_amount = "100"
    limit_unit   = "EUR"

    cost_filter = [
      {
        name   = "Service"
        values = ["AmazonEC2"]
      }
    ]

    notification = [
      {
        comparison_operator        = "GREATER_THAN"
        threshold                  = 80
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_email_addresses = ["user@example.com"]
      }
    ]
  }
}
