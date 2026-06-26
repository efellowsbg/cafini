module "sns_topic_policies" {
  source   = "./modules/sns_topic_policy"
  for_each = var.sns_topic_policies

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    iam_policies = module.iam_policies
    sns_topics   = module.sns_topics
  }
}

module "sns_topic_subscriptions" {
  source   = "./modules/sns_topic_subscription"
  for_each = var.sns_topic_subscriptions

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    iam_roles  = module.iam_roles
    sns_topics = module.sns_topics
    sqs_queues = module.sqs_queues
  }
}
