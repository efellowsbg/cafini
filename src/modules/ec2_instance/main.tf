resource "aws_instance" "main" {
  # TODO: Create default modules for different types of ec2s
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
  subnet_id                            = local.subnet_id
  security_groups                      = local.security_groups
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

  enclave_options {
    enabled = try(var.settings.enclave_options.enabled, false)
  }

  maintenance_options {
    auto_recovery = try(var.settings.maintenance_options.auto_recovery, "default")
  }

  dynamic "primary_network_interface" {
    for_each = can(var.settings.primary_network_interface) ? [1] : []

    content {
      delete_on_termination = try(var.settings.primary_network_interface.delete_on_termination, true)
      network_interface_id  = local.network_interface_id
    }
  }

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

  dynamic "private_dns_name_options" {
    for_each = can(var.settings.private_dns_name_options) ? [1] : []

    content {
      enable_resource_name_dns_a_record    = try(var.settings.private_dns_name_options.enable_resource_name_dns_a_record, null)
      enable_resource_name_dns_aaaa_record = try(var.settings.private_dns_name_options.enable_resource_name_dns_aaaa_record, null)
      hostname_type                        = try(var.settings.private_dns_name_options.hostname_type, null)
    }
  }
}
