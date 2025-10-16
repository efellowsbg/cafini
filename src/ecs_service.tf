module "ecs_services" {
  source   = "./modules/ecs_service"
  for_each = var.ecs_services

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    ecs_clusters = module.ecs_clusters
    #ecs_task_definitions = module.ecs_task_definitions #module not created yet
    iam_roles       = module.iam_roles
    vpcs            = module.vpcs
    security_groups = module.security_groups
  }
}
