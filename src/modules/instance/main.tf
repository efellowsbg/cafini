resource "aws_instance" "main" {
  # security_groups, private_dns_name_options, primary_network_interface, network_interface, subnet_id
  # Region param suppose to fallback to the default region from the provider if not set
  instance_type                        = try(var.settings.launch_template, var.settings.instance_type)
  region                               = try(var.settings.region, null)
  ami                                  = try(var.settings.ami, null)
  associate_public_ip_address          = try(var.settings.associate_public_ip_address, null)
  disable_api_stop                     = try(var.settings.disable_api_stop, null)
  disable_api_termination              = try(var.settings.disable_api_termination, null)
  ebs_optimized                        = try(var.settings.ebs_optimized, null)
  enable_primary_ipv6                  = try(var.settings.enable_primary_ipv6, null)
  force_destroy                        = try(var.settings.force_destroy, null)
  get_password_data                    = try(var.settings.get_password_data, null)
  instance_initiated_shutdown_behavior = try(var.settings.instance_initiated_shutdown_behavior, null)
  hibernation                          = try(var.settings.hibernation, null)
  ipv6_address_count                   = try(var.settings.ipv6_address_count, null)
  ipv6_addresses                       = try(var.settings.ipv6_addresses, null)
  monitoring                           = try(var.settings.monitoring, null)
  placement_partition_number           = try(var.settings.placement.partition_number, null)
  private_ip                           = try(var.settings.private_ip, null)
  secondary_private_ips                = try(var.settings.secondary_private_ips, null)
  source_dest_check                    = try(var.settings.source_dest_check, null)
  tenancy                              = try(var.settings.tenancy, null)
  user_data                            = try(var.settings.user_data, null)
  user_data_base64                     = try(var.settings.user_data_base64, null)
  user_data_replace_on_change          = try(var.settings.user_data_replace_on_change, null)
  volume_tags                          = try(var.settings.volume_tags, null)
  availability_zone                    = local.availability_zone
  host_id                              = local.host_id
  host_resource_group_arn              = local.host_resource_group_arn
  iam_instance_profile                 = local.iam_instance_profile
  placement_group                      = local.placement_group_name
  placement_group_id                   = local.placement_group_id
  vpc_security_group_ids               = local.vpc_security_group_ids
  tags                                 = local.tags
  #TODO: Create pair from this resource
  key_name = local.key_name

  dynamic "capacity_reservation_specification" {
    for_each = can(var.settings.capacity_reservation_specification) ? [1] : []

    content {
      capacity_reservation_preference = try(var.settings.capacity_reservation_specification.capacity_reservation_preference, null)

      dynamic "capacity_reservation_target" {
        for_each = can(var.settings.capacity_reservation_specification.capacity_reservation_target) ? [1] : []

        content {
          capacity_reservation_id                 = local.capacity_reservation_id
          capacity_reservation_resource_group_arn = local.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = can(var.settings.cpu_options) ? [1] : []

    content {
      core_count       = try(var.settings.cpu_options.core_count, null)
      threads_per_core = try(var.settings.cpu_options.threads_per_core, null)
      amd_sev_snp      = try(var.settings.cpu_options.amd_sev_snp, null)
    }
  }

  dynamic "credit_specification" {
    for_each = can(var.settings.credit_specification) ? [1] : []

    content {
      cpu_credits = try(var.settings.credit_specification.cpu_credits, null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = try(var.settings.ebs_block_device, {})

    content {
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = try(ebs_block_device.value.delete_on_termination, null)
      encrypted             = try(ebs_block_device.value.encrypted, null)
      iops                  = try(ebs_block_device.value.iops, null)
      throughput            = try(ebs_block_device.value.throughput, null)
      volume_size           = try(ebs_block_device.value.volume_size, null)
      volume_type           = try(ebs_block_device.value.volume_type, null)
      snapshot_id           = try(ebs_block_device.value.snapshot_id, null)
      tags                  = try(ebs_block_device.value.tags, null)
      kms_key_id = try(
        var.resources.kms_keys[ebs_block_device.value.kms_key_ref].arn,
        try(ebs_block_device.value.kms_key_id, null)
      )
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = try(var.settings.ephemeral_block_device, {})

    content {
      device_name  = ephemeral_block_device.value.device_name
      virtual_name = try(ephemeral_block_device.value.virtual_name, null)
      no_device    = try(ephemeral_block_device.value.no_device, null)
    }
  }

  enclave_options {
    enabled = try(var.settings.enclave_options.enabled, false)
  }

  maintenance_options {
    auto_recovery = try(var.settings.maintenance_options.auto_recovery, "default")
  }

  dynamic "instance_market_options" {
    for_each = can(var.settings.instance_market_options) ? [1] : []

    content {
      market_type = try(var.settings.instance_market_options.market_type, null)

      dynamic "spot_options" {
        for_each = can(var.settings.instance_market_options.spot_options) ? [1] : []

        content {
          instance_interruption_behavior = try(var.settings.instance_market_options.spot_options.instance_interruption_behavior, null)
          max_price                      = try(var.settings.instance_market_options.spot_options.max_price, null)
          spot_instance_type             = try(var.settings.instance_market_options.spot_options.spot_instance_type, null)
          valid_until                    = try(var.settings.instance_market_options.spot_options.valid_until, null)
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

  dynamic "metadata_options" {
    for_each = can(var.settings.metadata_options) ? [1] : []

    content {
      http_endpoint               = try(var.settings.metadata_options.http_endpoint, null)
      http_tokens                 = try(var.settings.metadata_options.http_tokens, null)
      http_put_response_hop_limit = try(var.settings.metadata_options.http_put_response_hop_limit, null)
      http_protocol_ipv6          = try(var.settings.metadata_options.http_protocol_ipv6, null)
      instance_metadata_tags      = try(var.settings.metadata_options.instance_metadata_tags, null)
    }
  }

  dynamic "root_block_device" {
    for_each = can(var.settings.root_block_device) ? [1] : []

    content {
      delete_on_termination = try(var.settings.root_block_device.delete_on_termination, null)
      encrypted             = try(var.settings.root_block_device.encrypted, null)
      iops                  = try(var.settings.root_block_device.iops, null)
      throughput            = try(var.settings.root_block_device.throughput, null)
      volume_size           = try(var.settings.root_block_device.volume_size, null)
      volume_type           = try(var.settings.root_block_device.volume_type, null)
      kms_key_id = try(
        var.resources.kms_keys[var.settings.root_block_device.kms_key_ref].arn,
        try(var.settings.root_block_device.kms_key_id, null)
      )
      tags = try(var.settings.root_block_device.tags, null)
    }
  }

  # dynamic "maintenance_options" {
  #   for_each = can(var.settings.maintenance_options) ? [1] : []

  #   content {
  #     auto_recovery = try(var.settings.maintenance_options.auto_recovery, null)
  #   }
  # }

  # dynamic "hibernation_options" {
  #   for_each = can(var.settings.hibernation_options) ? [1] : []

  #   content {
  #     configured = try(var.settings.hibernation_options.configured, null)
  #   }
  # }

  # dynamic "enclave_options" {
  #   for_each = can(var.settings.enclave_options) ? [1] : []

  #   content {
  #     enabled = try(var.settings.enclave_options.enabled, null)
  #   }
  # }

  # dynamic "instance_requirements" {
  #   for_each = can(var.settings.instance_requirements) ? [1] : []

  #   content {

  #     memory_mib {
  #       min = var.settings.instance_requirements.memory_mib.min
  #       max = try(var.settings.instance_requirements.memory_mib.max, null)
  #     }

  #     vcpu_count {
  #       min = var.settings.instance_requirements.vcpu_count.min
  #       max = try(var.settings.instance_requirements.vcpu_count.max, null)
  #     }

  #     accelerator_manufacturers                               = try(var.settings.instance_requirements.accelerator_manufacturers, null)
  #     accelerator_names                                       = try(var.settings.instance_requirements.accelerator_names, null)
  #     accelerator_types                                       = try(var.settings.instance_requirements.accelerator_types, null)
  #     allowed_instance_types                                  = try(var.settings.instance_requirements.allowed_instance_types, null)
  #     bare_metal                                              = try(var.settings.instance_requirements.bare_metal, null)
  #     burstable_performance                                   = try(var.settings.instance_requirements.burstable_performance, null)
  #     cpu_manufacturers                                       = try(var.settings.instance_requirements.cpu_manufacturers, null)
  #     excluded_instance_types                                 = try(var.settings.instance_requirements.excluded_instance_types, null)
  #     instance_generations                                    = try(var.settings.instance_requirements.instance_generations, null)
  #     local_storage                                           = try(var.settings.instance_requirements.local_storage, null)
  #     local_storage_types                                     = try(var.settings.instance_requirements.local_storage_types, null)
  #     max_spot_price_as_percentage_of_optimal_on_demand_price = try(var.settings.instance_requirements.max_spot_price_as_percentage_of_optimal_on_demand_price, null)
  #     on_demand_max_price_percentage_over_lowest_price        = try(var.settings.instance_requirements.on_demand_max_price_percentage_over_lowest_price, null)
  #     require_hibernate_support                               = try(var.settings.instance_requirements.require_hibernate_support, null)
  #     spot_max_price_percentage_over_lowest_price             = try(var.settings.instance_requirements.spot_max_price, null)

  #     dynamic "total_local_storage_gb" {
  #       for_each = can(var.settings.instance_requirements.total_local_storage_gb) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.total_local_storage_gb.max, null)
  #         min = try(var.settings.instance_requirements.total_local_storage_gb.min, null)
  #       }
  #     }

  #     dynamic "memory_gib_per_vcpu" {
  #       for_each = can(var.settings.instance_requirements.memory_gib_per_vcpu) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.memory_gib_per_vcpu.max, null)
  #         min = try(var.settings.instance_requirements.memory_gib_per_vcpu.min, null)
  #       }
  #     }

  #     dynamic "network_bandwidth_gbps" {
  #       for_each = can(var.settings.instance_requirements.network_bandwidth_gbps) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.network_bandwidth_gbps.max, null)
  #         min = try(var.settings.instance_requirements.network_bandwidth_gbps.min, null)
  #       }
  #     }

  #     dynamic "network_interface_count" {
  #       for_each = can(var.settings.instance_requirements.network_interface_count) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.network_interface_count.max, null)
  #         min = try(var.settings.instance_requirements.network_interface_count.min, null)
  #       }
  #     }

  #     dynamic "baseline_ebs_bandwidth_mbps" {
  #       for_each = can(var.settings.instance_requirements.baseline_ebs_bandwidth_mbps) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.baseline_ebs_bandwidth_mbps.max, null)
  #         min = try(var.settings.instance_requirements.baseline_ebs_bandwidth_mbps.min, null)
  #       }
  #     }

  #     dynamic "accelerator_total_memory_mib" {
  #       for_each = can(var.settings.instance_requirements.accelerator_total_memory_mib) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.accelerator_total_memory_mib.max, null)
  #         min = try(var.settings.instance_requirements.accelerator_total_memory_mib.min, null)
  #       }
  #     }

  #     dynamic "accelerator_count" {
  #       for_each = can(var.settings.instance_requirements.accelerator_count) ? [1] : []

  #       content {
  #         max = try(var.settings.instance_requirements.accelerator_count.max, null)
  #         min = try(var.settings.instance_requirements.accelerator_count.min, null)
  #       }
  #     }

  #   }
  # }

  # dynamic "block_device_mappings" {
  #   for_each = try(var.settings.block_device_mappings, {})

  #   content {
  #     device_name  = block_device_mappings.value.device_name
  #     no_device    = try(block_device_mappings.value.no_device, null)
  #     virtual_name = try(block_device_mappings.value.virtual_name, null)

  #     # TODO ebs can be a single block
  #     dynamic "ebs" {
  #       for_each = try(block_device_mappings.value.ebs, {})

  #       content {
  #         delete_on_termination      = try(ebs.value.delete_on_termination, null)
  #         encrypted                  = try(ebs.value.encrypted, null)
  #         iops                       = try(ebs.value.iops, null)
  #         throughput                 = try(ebs.value.throughput, null)
  #         volume_size                = try(ebs.value.volume_size, null)
  #         volume_initialization_rate = try(ebs.value.volume_initialization_rate, null)
  #         volume_type                = try(ebs.value.volume_type, null)
  #         snapshot_id                = try(ebs.value.snapshot_id, null)
  #         kms_key_id = try(
  #           var.resources.kms_keys[ebs.value.kms_key_ref].arn,
  #           try(ebs.value.kms_key_id, null)
  #         )
  #       }
  #     }
  #   }
  # }

  # dynamic "iam_instance_profile" {
  #   for_each = can(var.settings.iam_instance_profile) ? [1] : []

  #   content {
  #     arn  = local.iam_instance_profile_arn
  #     name = local.iam_instance_profile_name
  #   }
  # }

  # dynamic "license_specification" {
  #   for_each = try(var.settings.license_specification, {})

  #   content {
  #     license_configuration_arn = try(license_specification.value.license_configuration_arn, null)
  #   }
  # }

  # dynamic "monitoring" {
  #   for_each = can(var.settings.monitoring) ? [1] : []

  #   content {
  #     enabled = try(var.settings.monitoring.enabled, null)
  #   }
  # }

  # dynamic "network_interfaces" {
  #   for_each = try(var.settings.network_interfaces, {})

  #   content {
  #     associate_carrier_ip_address = try(network_interfaces.value.associate_carrier_ip_address, null)
  #     associate_public_ip_address  = try(network_interfaces.value.associate_public_ip_address, null)
  #     delete_on_termination        = try(network_interfaces.value.delete_on_termination, null)
  #     description                  = try(network_interfaces.value.description, null)
  #     device_index                 = try(network_interfaces.value.device_index, null)
  #     interface_type               = try(network_interfaces.value.interface_type, null)
  #     ipv4_prefix_count            = try(network_interfaces.value.ipv4_prefix_count, null)
  #     ipv4_prefixes                = try(network_interfaces.value.ipv4_prefixes, null)
  #     ipv6_addresses               = try(network_interfaces.value.ipv6_addresses, null)
  #     ipv6_address_count           = try(network_interfaces.value.ipv6_address_count, null)
  #     ipv6_prefix_count            = try(network_interfaces.value.ipv6_prefix_count, null)
  #     ipv6_prefixes                = try(network_interfaces.value.ipv6_prefixes, null)
  #     network_card_index           = try(network_interfaces.value.network_card_index, null)
  #     primary_ipv6                 = try(network_interfaces.value.primary_ipv6, null)
  #     ipv4_address_count           = try(network_interfaces.value.ipv4_address_count, null)
  #     ipv4_addresses               = try(network_interfaces.value.ipv4_addresses, null)
  #     private_ip_address           = try(network_interfaces.value.private_ip_address, null)

  #     network_interface_id = try(
  #       var.resources.network_interfaces[network_interfaces.value.network_interface_ref].id,
  #       try(network_interfaces.value.network_interface_id, null)
  #     )

  #     subnet_id = (
  #       network_interfaces.value.subnet_ref != null && network_interfaces.value.subnet_ref != "" ?
  #       var.resources.vpcs[split("/", network_interfaces.value.subnet_ref)[0]].subnets[split("/", network_interfaces.value.subnet_ref)[1]].id :
  #       (network_interfaces.value.subnet_id != null ? network_interfaces.value.subnet_id : null)
  #     )

  #     security_groups = (length(try(network_interfaces.value.security_group_refs, [])) > 0 ?
  #       [for sg_ref in network_interfaces.value.security_group_refs : var.resources.security_groups[sg_ref].id] :
  #       length(try(network_interfaces.value.security_group_ids, [])) > 0 ?
  #       network_interfaces.value.security_group_ids :
  #       null
  #     )
  #     # TODO: The whole block and it's dynamic cnotents can be a single or no block
  #     dynamic "ena_srd_specification" {
  #       for_each = try(network_interfaces.value.ena_srd_specification, {})

  #       content {
  #         ena_srd_enabled = try(ena_srd_specification.value.ena_srd_enabled, null)

  #         dynamic "ena_srd_udp_specification" {
  #           for_each = try(ena_srd_specification.value.ena_srd_udp_specification, {})

  #           content {
  #             ena_srd_udp_enabled = try(ena_srd_udp_specification.value.ena_srd_udp_enabled, null)
  #           }

  #         }
  #       }
  #     }
  #     # TODO: The whole block and it's dynamic cnotents can be a single or no block
  #     dynamic "connection_tracking_specification" {
  #       for_each = try(network_interfaces.value.connection_tracking_specification, {})

  #       content {
  #         tcp_established_timeout = try(connection_tracking_specification.value.tcp_established_timeout, null)
  #         udp_stream_timeout      = try(connection_tracking_specification.value.udp_stream_timeout, null)
  #         udp_timeout             = try(connection_tracking_specification.value.udp_timeout, null)
  #       }
  #     }
  #   }
  # }

  # dynamic "placement" {
  #   for_each = can(var.settings.placement) ? [1] : []

  #   content {
  #     availability_zone       = try(var.settings.placement.availability_zone, null)
  #     affinity                = try(var.settings.placement.affinity, null)
  #     partition_number        = try(var.settings.placement.partition_number, null)
  #     spread_domain           = try(var.settings.placement.spread_domain, null)
  #     tenancy                 = try(var.settings.placement.tenancy, null)
  #     group_name              = local.placement_group_name
  #     group_id                = local.placement_group_id
  #     host_id                 = local.placement_host
  #     host_resource_group_arn = local.placement_host_rg
  #   }
  # }

  # dynamic "private_dns_name_options" {
  #   for_each = can(var.settings.private_dns_name_options) ? [1] : []

  #   content {
  #     enable_resource_name_dns_a_record    = try(var.settings.private_dns_name_options.enable_resource_name_dns_a_record, null)
  #     enable_resource_name_dns_aaaa_record = try(var.settings.private_dns_name_options.enable_resource_name_dns_aaaa_record, null)
  #     hostname_type                        = try(var.settings.private_dns_name_options.hostname_type, null)
  #   }
  # }

  # dynamic "tag_specifications" {
  #   for_each = try(var.settings.tag_specifications, {})

  #   content {
  #     resource_type = tag_specifications.value.resource_type
  #     tags          = tag_specifications.value.tags
  #   }
  # }
}
