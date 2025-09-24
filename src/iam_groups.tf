module "iam_groups" {
  source = "../modules/iam_group"
  for_each = var.iam_groups

	settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}