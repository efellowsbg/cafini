module "efs_file_system" {
  source = "./modules/efs_file_system"

  for_each = var.efs_file_systems

  settings        = each.value
  global_settings = local.global_settings

  resources = {}
}
