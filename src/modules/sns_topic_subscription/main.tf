resource "aws_sns_topic_subscription" "main" {
  topic_arn                       = local.topic_arn
  protocol                        = var.settings.protocol
  endpoint                        = local.endpoint
  endpoint_auto_confirms          = try(var.settings.endpoint_auto_confirms, null)
  confirmation_timeout_in_minutes = try(var.settings.confirmation_timeout_in_minutes, null)
  raw_message_delivery            = try(var.settings.raw_message_delivery, null)
  filter_policy                   = try(var.settings.filter_policy, null)
  filter_policy_scope             = try(var.settings.filter_policy_scope, null)
  redrive_policy                  = local.redrive_policy
  subscription_role_arn           = local.subscription_role_arn
  replay_policy                   = try(var.settings.replay_policy, null)
}
