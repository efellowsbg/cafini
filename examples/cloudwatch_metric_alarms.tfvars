cloudwatch_metric_alarms = {
  metric_alarm_test = {
    alarm_name          = "cpu-math-alarm-test"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    threshold           = 80
    treat_missing_data  = "notBreaching"
    actions_enabled     = true
    alarm_description   = "Alarm for high CPU with metric math"

    alarm_actions             = ["arn:aws:sns:eu-central-1:123456789012:alarm-topic"]
    ok_actions                = ["arn:aws:sns:eu-central-1:123456789012:ok-topic"]
    insufficient_data_actions = ["arn:aws:sns:eu-central-1:123456789012:insufficient-data-topic"]

    metric_querys = {
      query1 = {
        id          = "e1"
        expression  = "m1 + m2"
        label       = "Sum CPU"
        return_data = true
        metrics = {
          m1 = {
            metric_name = "CPUUtilization"
            namespace   = "AWS/EC2"
            period      = 60
            stat        = "Average"
          }
          m2 = {
            metric_name = "CPUUtilization"
            namespace   = "AWS/EC2"
            period      = 60
            stat        = "Maximum"
          }
        }
      }
    }
  }
}
