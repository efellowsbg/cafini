module "sqs_queues" {
  source   = "./modules/sqs_queue"
  for_each = var.sqs_queues

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    kms_keys = module.kms_keys
  }
}

module "sqs_queue_policies" {
  source   = "./modules/sqs_queue_policy"
  for_each = var.sqs_queue_policies

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    iam_policies = module.iam_policies
    sqs_queues   = module.sqs_queues
  }
}
