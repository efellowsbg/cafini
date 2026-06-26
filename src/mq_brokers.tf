module "mq_brokers" {
  source   = "./modules/mq_broker"
  for_each = var.mq_brokers

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    kms_keys        = module.kms_keys
    security_groups = module.security_groups
    vpcs            = module.vpcs
  }
}
