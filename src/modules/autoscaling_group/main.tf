resource "aws_autoscaling_group" "main" {
  max_size                         = var.settings.max_size
  min_size                         = var.settings.min_size
  region                           = try(var.settings.region, null)
  name                             = try(var.settings.name, null)
  name_prefix                      = try(var.settings.name_prefix, null)
  availability_zones               = local.availability_zones
  capacity_rebalance               = try(var.settings.capacity_rebalance, null)
  context                          = try(var.settings.context, null)
  default_cooldown                 = try(var.settings.default_cooldown, null)
  default_instance_warmup          = try(var.settings.default_instance_warmup, null)
  ignore_failed_scaling_activities = try(var.settings.ignore_failed_scaling_activities, null)
  launch_configuration             = local.launch_configuration


  dynamic "availability_zone_distribution" {
    for_each = can(var.settings.availability_zone_distribution) ? [1] : []

    content {
      capacity_distribution_strategy = var.settings.availability_zone_distribution.capacity_distribution_strategy
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = can(var.settings.capacity_reservation_specification) ? [1] : []

    content {
      capacity_reservation_preference = try(var.settings.availability_zone_distribution.capacity_reservation_preference, "default")

      dynamic "capacity_reservation_target" {
        for_each = can(var.settings.capacity_reservation_specification.capacity_reservation_target) ? [1] : []

        content {
          capacity_reservation_ids                 = local.capacity_reservation_ids
          capacity_reservation_resource_group_arns = try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_resource_group_arns, null)
        }
      }
    }
  }

  dynamic "launch_template" {
    for_each = can(var.settings.launch_template) ? [1] : []

    content {
      id      = local.launch_template_id
      name    = local.launch_template_name
      version = try(var.settings.launch_template.version, null)
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = can(var.settings.mixed_instances_policy) ? [1] : []

    content {
      dynamic "instances_distribution" {
        for_each = can(var.settings.mixed_instances_policy.instances_distribution) ? [1] : []

        content {
          on_demand_allocation_strategy            = try(var.settings.mixed_instances_policy.instances_distribution.on_demand_allocation_strategy, null)
          on_demand_base_capacity                  = try(var.settings.mixed_instances_policy.instances_distribution.on_demand_base_capacity, null)
          on_demand_percentage_above_base_capacity = try(var.settings.mixed_instances_policy.instances_distribution.on_demand_percentage_above_base_capacity, null)
          spot_allocation_strategy                 = try(var.settings.mixed_instances_policy.instances_distribution.spot_allocation_strategy, null)
          spot_instance_pools                      = try(var.settings.mixed_instances_policy.instances_distribution.spot_instance_pools, null)
          spot_max_price                           = try(var.settings.mixed_instances_policy.instances_distribution.spot_max_price, null)
        }
      }

      launch_template {

        launch_template_specification {
          launch_template_id   = local.mi_policy_launch_template_id
          launch_template_name = local.mi_policy_launch_template_name
          version              = try(var.settings.mixed_instances_policy.launch_template.launch_template_specification.version, null)
        }

        dynamic "override" {
          for_each = try(var.settings.mixed_instances_policy.launch_template.override, {})

          content {
            instance_type     = try(override.value.instance_type, null)
            weighted_capacity = try(override.value.weighted_capacity, null)

            dynamic "instance_requirements" {
              for_each = can(override.value.instance_requirements) ? [1] : []

              content {
                vcpu_count {
                  min = override.value.instance_requirements.vcpu_count.min
                  max = try(override.value.instance_requirements.vcpu_count.max, null)
                }

                accelerator_manufacturers                               = try(override.value.instance_requirements.accelerator_manufacturers, null)
                accelerator_names                                       = try(override.value.instance_requirements.accelerator_names, null)
                accelerator_types                                       = try(override.value.instance_requirements.accelerator_types, null)
                allowed_instance_types                                  = try(override.value.instance_requirements.allowed_instance_types, null)
                bare_metal                                              = try(override.value.instance_requirements.bare_metal, null)
                burstable_performance                                   = try(override.value.instance_requirements.burstable_performance, null)
                cpu_manufacturers                                       = try(override.value.instance_requirements.cpu_manufacturers, null)
                excluded_instance_types                                 = try(override.value.instance_requirements.excluded_instance_types, null)
                instance_generations                                    = try(override.value.instance_requirements.instance_generations, null)
                local_storage                                           = try(override.value.instance_requirements.local_storage, null)
                local_storage_types                                     = try(override.value.instance_requirements.local_storage_types, null)
                max_spot_price_as_percentage_of_optimal_on_demand_price = try(override.value.instance_requirements.max_spot_price_as_percentage_of_optimal_on_demand_price, null)
                spot_max_price_percentage_over_lowest_price             = try(override.value.instance_requirements.spot_max_price_percentage_over_lowest_price, null)
                on_demand_max_price_percentage_over_lowest_price        = try(override.value.instance_requirements.on_demand_max_price_percentage_over_lowest_price, null)
                require_hibernate_support                               = try(override.value.instance_requirements.require_hibernate_support, null)

                dynamic "accelarator_count" {
                  for_each = can(override.value.instance_requirements.accelerator_count) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.accelerator_count.max, null)
                    min = try(override.value.instance_requirements.accelerator_count.min, null)
                  }
                }

                dynamic "accelarator_total_memory_mib" {
                  for_each = can(override.value.instance_requirements.accelerator_total_memory_mib) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.accelerator_total_memory_mib.max, null)
                    min = try(override.value.instance_requirements.accelerator_total_memory_mib.min, null)
                  }
                }

                dynamic "baseline_ebs_bandwidth_mbps" {
                  for_each = can(override.value.instance_requirements.baseline_ebs_bandwidth_mbps) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.baseline_ebs_bandwidth_mbps.max, null)
                    min = try(override.value.instance_requirements.baseline_ebs_bandwidth_mbps.min, null)
                  }
                }

                dynamic "memory_mib" {
                  for_each = can(override.value.instance_requirements.memory_mib) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.memory_mib.max, null)
                    min = try(override.value.instance_requirements.memory_mib.min, null)
                  }
                }

                dynamic "network_bandwidth_gbps" {
                  for_each = can(override.value.instance_requirements.network_bandwidth_gbps) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.network_bandwidth_gbps.max, null)
                    min = try(override.value.instance_requirements.network_bandwidth_gbps.min, null)
                  }
                }

                dynamic "network_interface_count" {
                  for_each = can(override.value.instance_requirements.network_interface_count) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.network_interface_count.max, null)
                    min = try(override.value.instance_requirements.network_interface_count.min, null)
                  }
                }

                dynamic "total_local_storage_gb" {
                  for_each = can(override.value.instance_requirements.total_local_storage_gb) ? [1] : []

                  content {
                    max = try(override.value.instance_requirements.total_local_storage_gb.max, null)
                    min = try(override.value.instance_requirements.total_local_storage_gb.min, null)
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "initial_lifecycle_hook" {
    for_each = can(var.settings.initial_lifecycle_hook) ? [1] : []

    content {
      default_result          = try(var.settings.initial_lifecycle_hook.default_result, null)
      heartbeat_timeout       = try(var.settings.initial_lifecycle_hook.heartbeat_timeout, null)
      lifecycle_transition    = var.settings.initial_lifecycle_hook.lifecycle_transition
      name                    = var.settings.initial_lifecycle_hook.name
      notification_metadata   = try(var.settings.initial_lifecycle_hook.notification_metadata, null)
      notification_target_arn = try(var.settings.initial_lifecycle_hook.notification_target_arn, null)
      role_arn                = try(var.settings.initial_lifecycle_hook.role_arn, null)
    }
  }
}
