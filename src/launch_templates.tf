module "launch_templates" {
  source   = "./modules/launch_template"
  for_each = var.launch_templates

  settings        = each.value
  global_settings = local.global_settings

  resources = {

  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
