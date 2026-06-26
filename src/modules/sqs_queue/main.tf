resource "aws_sqs_queue" "main" {
  name                              = try(var.settings.name, null)
  name_prefix                       = try(var.settings.name_prefix, null)
  content_based_deduplication       = try(var.settings.content_based_deduplication, null)
  deduplication_scope               = try(var.settings.deduplication_scope, null)
  delay_seconds                     = try(var.settings.delay_seconds, null)
  fifo_queue                        = try(var.settings.fifo_queue, null)
  fifo_throughput_limit             = try(var.settings.fifo_throughput_limit, null)
  kms_data_key_reuse_period_seconds = try(var.settings.kms_data_key_reuse_period_seconds, null)
  kms_master_key_id                 = local.kms_master_key_id
  max_message_size                  = try(var.settings.max_message_size, null)
  message_retention_seconds         = try(var.settings.message_retention_seconds, null)
  policy                            = try(var.settings.policy, null)
  receive_wait_time_seconds         = try(var.settings.receive_wait_time_seconds, null)
  redrive_allow_policy              = try(var.settings.redrive_allow_policy, null)
  redrive_policy                    = local.redrive_policy
  sqs_managed_sse_enabled           = try(var.settings.sqs_managed_sse_enabled, null)
  visibility_timeout_seconds        = try(var.settings.visibility_timeout_seconds, null)
  tags                              = local.tags
}
