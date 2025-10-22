module "cloudwatch_metric_alarms" {
  source   = "./modules/cloudwatch_metric_alarm"
  for_each = var.cloudwatch_metric_alarms

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # sns_topics = module.sns_topics
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
