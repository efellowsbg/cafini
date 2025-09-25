module security_groups {
  source = "./modules/security_group"
  for_each = var.security_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {}
  
  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}