module "iam_users" {
  source   = "./modules/iam_user"
  for_each = var.iam_users

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
