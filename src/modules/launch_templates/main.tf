resource "aws_launch_template" "main" {
  # Region param suppose to fallback to the default region from the provider if not set
  region                               = try(var.settings.region, null)
  name                                 = try(var.settings.name, null)
  name_prefix                          = try(var.settings.name_prefix, null)
  default_version                      = try(var.settings.default_version, null)
  description                          = try(var.settings.description, null)
  disable_api_stop                     = try(var.settings.disable_api_stop, null)
  disable_api_termination              = try(var.settings.disable_api_termination, null)
  ebs_optimized                        = try(var.settings.ebs_optimized, null)
  image_id                             = try(var.settings.image_id, null)
  instance_initiated_shutdown_behavior = try(var.settings.instance_initiated_shutdown_behavior, null)
  instance_type                        = try(var.settings.instance_type, null)
  kernel_id                            = try(var.settings.kernel_id, null)
  key_name                             = try(var.settings.key_name, null)
  ram_disk_id                          = try(var.settings.ram_disk_id, null)
  security_group_names                 = try(var.settings.security_group_names, null)
  update_default_version               = try(var.settings.update_default_version, null)
  user_data                            = try(var.settings.user_data, null)
  vpc_security_group_ids               = try(var.settings.vpc_security_group_ids, null)
  tags                                 = local.tags

  dynamic "instance_requirements" {
    for_each = try(var.settings.instance_requirements, {})

    content {

      memory_mib {
        min = var.settings.instance_requirements.memory_mib.min
        max = try(var.settings.instance_requirements.memory_mib.max, null)
      }

      vcpu_count {
        min = vcpu_count.value.min
        max = try(vcpu_count.value.max, null)
      }

      accelerator_manufacturers                               = try(instance_requirements.value.accelerator_manufacturers, null)
      accelerator_names                                       = try(instance_requirements.value.accelerator_names, null)
      accelerator_types                                       = try(instance_requirements.value.accelerator_types, null)
      allowed_instance_types                                  = try(instance_requirements.value.allowed_instance_types, null)
      bare_metal                                              = try(instance_requirements.value.bare_metal, null)
      burstable_performance                                   = try(instance_requirements.value.burstable_performance, null)
      cpu_manufacturers                                       = try(instance_requirements.value.cpu_manufacturers, null)
      excluded_instance_types                                 = try(instance_requirements.value.excluded_instance_types, null)
      instance_generations                                    = try(instance_requirements.value.instance_generations, null)
      local_storage                                           = try(instance_requirements.value.local_storage, null)
      local_storage_types                                     = try(instance_requirements.value.local_storage_types, null)
      max_spot_price_as_percentage_of_optimal_on_demand_price = try(instance_requirements.value.max_spot_price_as_percentage_of_optimal_on_demand_price, null)
      on_demand_max_price_percentage_over_lowest_price        = try(instance_requirements.value.on_demand_max_price_percentage_over_lowest_price, null)
      require_hibernate_support                               = try(instance_requirements.value.require_hibernate_support, null)
      spot_max_price_percentage_over_lowest_price             = try(instance_requirements.value.spot_max_price, null)

      dynamic "total_local_storage_gb" {
        for_each = try(instance_requirements.value.total_local_storage_gb, {})

        content {
          max = try(total_local_storage_gb.value.max, null)
          min = try(total_local_storage_gb.value.min, null)
        }
      }

      dynamic "memory_gib_per_vcpu" {
        for_each = try(instance_requirements.value.memory_gib_per_vcpu, {})

        content {
          max = try(memory_gib_per_vcpu.value.max, null)
          min = try(memory_gib_per_vcpu.value.min, null)
        }
      }

      dynamic "network_bandwidth_gbps" {
        for_each = try(instance_requirements.value.network_bandwidth_gbps, {})

        content {
          max = try(network_bandwidth_gbps.value.max, null)
          min = try(network_bandwidth_gbps.value.min, null)
        }
      }

      dynamic "network_interface_count" {
        for_each = try(instance_requirements.value.network_interface_count, {})

        content {
          max = try(network_interface_count.value.max, null)
          min = try(network_interface_count.value.min, null)
        }

      }

      dynamic "baseline_ebs_bandwidth_mbps" {
        for_each = try(instance_requirements.value.baseline_ebs_bandwidth_mbps, {})

        content {
          max = try(baseline_ebs_bandwidth_mbps.value.max, null)
          min = try(baseline_ebs_bandwidth_mbps.value.min, null)
        }
      }

      dynamic "accelerator_total_memory_mib" {
        for_each = try(instance_requirements.value.accelerator_total_memory_mib, {})

        content {
          max = try(accelerator_total_memory_mib.value.max, null)
          min = try(accelerator_total_memory_mib.value.min, null)
        }
      }

      dynamic "accelerator_count" {
        for_each = try(instance_requirements.value.accelerator_count, {})

        content {
          max = try(accelerator_count.value.max, null)
          min = try(accelerator_count.value.min, null)
        }

      }

    }
  }

  dynamic "block_device_mappings" {
    for_each = try(var.settings.block_device_mappings, {})

    content {
      device_name  = block_device_mappings.value.device_name
      no_device    = try(block_device_mappings.value.no_device, null)
      virtual_name = try(block_device_mappings.value.virtual_name, null)

      dynamic "ebs" {
        for_each = try(block_device_mappings.value.ebs, {})

        content {
          delete_on_termination      = try(ebs.value.delete_on_termination, null)
          encrypted                  = try(ebs.value.encrypted, null)
          iops                       = try(ebs.value.iops, null)
          snapshot_id                = try(ebs.value.snapshot_id, null)
          throughput                 = try(ebs.value.throughput, null)
          volume_size                = try(ebs.value.volume_size, null)
          volume_initialization_rate = try(ebs.value.volume_initialization_rate, null)
          volume_type                = try(ebs.value.volume_type, null)
          kms_key_id = try(
            var.resources.kms_keys[ebs.value.kms_key_ref].arn,
            try(ebs.value.kms_key_id, null)
          )
        }
      }
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = try(var.settings.capacity_reservation_specification, {})

    content {
      capacity_reservation_preference = try(capacity_reservation_specification.value.capacity_reservation_preference, null)

      dynamic "capacity_reservation_target" {
        for_each = try(capacity_reservation_specification.value.capacity_reservation_target, {})

        content {
          capacity_reservation_id                 = try(capacity_reservation_target.value.capacity_reservation_id, null)
          capacity_reservation_resource_group_arn = try(capacity_reservation_target.value.capacity_reservation_resource_group_arn, null)
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = try(var.settings.cpu_options, {})

    content {
      amd_sev_snp      = try(cpu_options.value.amd_sev_snp, null)
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  dynamic "credit_specification" {
    for_each = try(var.settings.credit_specification, {})

    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  dynamic "enclave_options" {
    for_each = try(var.settings.enclave_options, {})

    content {
      enabled = enclave_options.value.enabled
    }
  }

  dynamic "hibernation_options" {
    for_each = try(var.settings.hibernation_options, {})

    content {
      configured = hibernation_options.value.configured
    }
  }

  dynamic "iam_instance_profile" {
    for_each = try(var.settings.iam_instance_profile, {})

    content {
      arn  = try(iam_instance_profile.value.arn, null)
      name = try(iam_instance_profile.value.name, null)
    }
  }

  dynamic "instance_market_options" {
    for_each = try(var.settings.instance_market_options, {})

    content {
      market_type = try(instance_market_options.value.market_type, null)

      dynamic "spot_options" {
        for_each = try(instance_market_options.value.spot_options, {})

        content {
          block_duration_minutes         = try(spot_options.value.block_duration_minutes, null)
          instance_interruption_behavior = try(spot_options.value.instance_interruption_behavior, null)
          max_price                      = try(spot_options.value.max_price, null)
          spot_instance_type             = try(spot_options.value.spot_instance_type, null)
          valid_until                    = try(spot_options.value.valid_until, null)
        }
      }
    }
  }

  dynamic "license_specification" {
    for_each = try(var.settings.license_specification, [])

    content {
      license_configuration_arn = license_specification.value.license_configuration_arn
    }
  }

  dynamic "maintenance_options" {
    for_each = try(var.settings.maintenance_options, {})

    content {
      auto_recovery = try(maintenance_options.value.auto_recovery, null)
    }
  }

  dynamic "metadata_options" {
    for_each = try(var.settings.metadata_options, {})

    content {
      http_endpoint               = try(metadata_options.value.http_endpoint, null)
      http_tokens                 = try(metadata_options.value.http_tokens, null)
      http_put_response_hop_limit = try(metadata_options.value.http_put_response_hop_limit, null)
      http_protocol_ipv6          = try(metadata_options.value.http_protocol_ipv6, null)
      instance_metadata_tags      = try(metadata_options.value.instance_metadata_tags, null)
    }
  }

  dynamic "monitoring" {
    for_each = try(var.settings.monitoring, {})

    content {
      enabled = monitoring.value.enabled
    }
  }

  dynamic "network_interfaces" {
    for_each = try(var.settings.network_interfaces, {})

    content {
      associate_carrier_ip_address = try(network_interfaces.value.associate_carrier_ip_address, null)
      associate_public_ip_address  = try(network_interfaces.value.associate_public_ip_address, null)
      delete_on_termination        = try(network_interfaces.value.delete_on_termination, null)
      description                  = try(network_interfaces.value.description, null)
      device_index                 = try(network_interfaces.value.device_index, null)
      interface_type               = try(network_interfaces.value.interface_type, null)
      ipv4_prefix_count            = try(network_interfaces.value.ipv4_prefix_count, null)
      ipv4_prefixes                = try(network_interfaces.value.ipv4_prefixes, null)
      ipv6_addresses               = try(network_interfaces.value.ipv6_addresses, null)
      ipv6_address_count           = try(network_interfaces.value.ipv6_address_count, null)
      ipv6_prefix_count            = try(network_interfaces.value.ipv6_prefix_count, null)
      ipv6_prefixes                = try(network_interfaces.value.ipv6_prefixes, null)
      network_interface_id         = try(network_interfaces.value.network_interface_id, null)
      network_card_index           = try(network_interfaces.value.network_card_index, null)
      primary_ipv6                 = try(network_interfaces.value.primary_ipv6, null)
      private_ip_address           = try(network_interfaces.value.private_ip_address, null)
      ipv4_address_count           = try(network_interfaces.value.ipv4_address_count, null)
      ipv4_addresses               = try(network_interfaces.value.ipv4_addresses, null)
      security_groups              = try(network_interfaces.value.security_groups, null)
      subnet_id                    = try(network_interfaces.value.subnet_id, null)

      dynamic "ena_srd_specification" {
        for_each = try(network_interfaces.value.ena_srd_specification, {})

        content {
          ena_srd_enabled = ena_srd_specification.value.ena_srd_enabled

          dynamic "ena_srd_udp_specification" {
            for_each = try(ena_srd_specification.value.ena_srd_udp_specification, {})

            content {
              ena_srd_udp_enabled = ena_srd_udp_specification.value.ena_srd_udp_enabled
            }

          }
        }
      }

      dynamic "connection_tracking_specification" {
        for_each = try(network_interfaces.value.connection_tracking_specification, {})

        content {
          tcp_established_timeout = try(connection_tracking_specification.value.tcp_established_timeout, null)
          udp_stream_timeout      = try(connection_tracking_specification.value.udp_stream_timeout, null)
          udp_timeout             = try(connection_tracking_specification.value.udp_timeout, null)
        }
      }
    }
  }

  dynamic "placement" {
    for_each = try(var.settings.placement, {})

    content {
      affinity                = try(placement.value.affinity, null)
      availability_zone       = try(placement.value.availability_zone, null)
      group_id                = try(placement.value.group_id, null)
      group_name              = try(placement.value.group_name, null)
      host_id                 = try(placement.value.host_id, null)
      host_resource_group_arn = try(placement.value.host_resource_group_arn, null)
      partition_number        = try(placement.value.partition_number, null)
      spread_domain           = try(placement.value.spread_domain, null)
      tenancy                 = try(placement.value.tenancy, null)
    }
  }

  dynamic "private_dns_name_options" {
    for_each = try(var.settings.private_dns_name_options, {})

    content {
      enable_resource_name_dns_a_record    = try(private_dns_name_options.value.enable_resource_name_dns_a_record, null)
      enable_resource_name_dns_aaaa_record = try(private_dns_name_options.value.enable_resource_name_dns_aaaa_record, null)
      hostname_type                        = try(private_dns_name_options.value.hostname_type, null)
    }
  }

  dynamic "tag_specifications" {
    for_each = try(var.settings.tag_specifications, {})

    content {
      resource_type = tag_specifications.value.resource_type
      tags          = tag_specifications.value.tags
    }
  }
}
