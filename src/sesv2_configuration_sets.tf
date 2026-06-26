module "sesv2_configuration_sets" {
  source   = "./modules/sesv2_configuration_set"
  for_each = var.sesv2_configuration_sets

  settings        = each.value
  global_settings = local.global_settings
  resources       = {}
}

module "sesv2_configuration_set_event_destinations" {
  source   = "./modules/sesv2_configuration_set_event_destination"
  for_each = var.sesv2_configuration_set_event_destinations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    sesv2_configuration_sets = module.sesv2_configuration_sets
    sns_topics               = module.sns_topics
  }
}
