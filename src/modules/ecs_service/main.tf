resource "aws_ecs_service" "main" {
  name   = var.settings.name
  region = try(var.settings.region, null)
  tags   = local.tags

  cluster = local.cluster_arn
  # task_definition = local.task_definition_arn
  iam_role = local.iam_role_arn

  desired_count                      = try(var.settings.desired_count, null)
  launch_type                        = try(var.settings.launch_type, null)
  scheduling_strategy                = try(var.settings.scheduling_strategy, null)
  platform_version                   = try(var.settings.platform_version, null)
  enable_ecs_managed_tags            = try(var.settings.enable_ecs_managed_tags, true)
  enable_execute_command             = try(var.settings.enable_execute_command, false)
  force_new_deployment               = try(var.settings.force_new_deployment, false)
  wait_for_steady_state              = try(var.settings.wait_for_steady_state, false)
  propagate_tags                     = try(var.settings.propagate_tags, "SERVICE")
  deployment_maximum_percent         = try(var.settings.deployment_maximum_percent, null)
  deployment_minimum_healthy_percent = try(var.settings.deployment_minimum_healthy_percent, null)

  dynamic "deployment_configuration" {
    for_each = can(var.settings.deployment_configuration) ? [1] : []
    content {
      # The new block supports BLUE/GREEN or ROLLING strategies
      strategy             = try(var.settings.deployment_configuration.strategy, null)
      bake_time_in_minutes = try(var.settings.deployment_configuration.bake_time_in_minutes, null)

      dynamic "lifecycle_hook" {
        for_each = try(var.settings.deployment_configuration.lifecycle_hook, [])
        content {
          hook_target_arn  = try(lifecycle_hook.value.hook_target_arn, null)
          role_arn         = try(lifecycle_hook.value.role_arn, null)
          lifecycle_stages = try(lifecycle_hook.value.lifecycle_stages, null)
          hook_details     = try(lifecycle_hook.value.hook_details, null)
        }
      }
    }
  }
}
