module security_groups {
  source = ".../modules/_networking/vpcsecurity_group"
  for_each = var.security_groups

  settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}