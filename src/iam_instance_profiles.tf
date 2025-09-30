module "iam_instance_profiles" {
  source   = "./modules/iam_instance_profile"
  for_each = var.iam_instance_profiles

  settings        = each.value
  global_settings = local.global_settings

  resources = {}
}
