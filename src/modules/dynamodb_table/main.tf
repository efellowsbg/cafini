resource "aws_dynamodb_table" "main" {
  name         = var.settings.name
  hash_key     = var.settings.hash_key
  range_key    = try(var.settings.range_key, null)
  billing_mode = try(var.settings.billing_mode, null)
  region       = try(var.settings.region, null)

  read_capacity  = try(var.settings.read_capacity, null)
  write_capacity = try(var.settings.write_capacity, null)
  table_class    = try(var.settings.table_class, null)

  deletion_protection_enabled = try(var.settings.deletion_protection_enabled, false)
  stream_enabled              = try(var.settings.stream_enabled, false)
  stream_view_type            = try(var.settings.stream_view_type, null)

  attribute {
    name = var.settings.attribute.name
    type = var.settings.attribute.type
  }

  dynamic "local_secondary_index" {
    for_each = try(var.settings.local_secondary_index, {})
    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = try(local_secondary_index.value.non_key_attributes, null)
    }
  }

  dynamic "global_secondary_index" {
    for_each = try(var.settings.global_secondary_index, {})
    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      range_key          = try(global_secondary_index.value.range_key, null)
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = try(global_secondary_index.value.non_key_attributes, null)
      read_capacity      = try(global_secondary_index.value.read_capacity, null)
      write_capacity     = try(global_secondary_index.value.write_capacity, null)
    }
  }

  dynamic "replica" {
    for_each = try(var.settings.replica, {})
    content {
      region_name                 = replica.value.region_name
      kms_key_arn                 = try(local.kms_key_arn, null)
      consistency_mode            = try(replica.value.consistency_mode, null)
      point_in_time_recovery      = try(replica.value.point_in_time_recovery, null)
      propagate_tags              = try(replica.value.propagate_tags, null)
      deletion_protection_enabled = try(replica.value.deletion_protection_enabled, null)
    }
  }

  dynamic "ttl" {
    for_each = can(var.settings.ttl) ? [1] : []
    content {
      attribute_name = try(var.settings.ttl.attribute_name, null)
      enabled        = try(var.settings.ttl.enabled, false)
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = can(var.settings.point_in_time_recovery) ? [1] : []
    content {
      enabled                 = try(var.settings.point_in_time_recovery.enabled, false)
      recovery_period_in_days = try(var.settings.point_in_time_recovery.recovery_period_in_days, null)
    }
  }

  dynamic "server_side_encryption" {
    for_each = can(var.settings.server_side_encryption) ? [1] : []
    content {
      enabled     = try(var.settings.server_side_encryption.enabled, true)
      kms_key_arn = try(local.kms_key_arn, null)
    }
  }

  dynamic "on_demand_throughput" {
    for_each = can(var.settings.on_demand_throughput) ? [1] : []
    content {
      max_read_request_units  = try(var.settings.on_demand_throughput.max_read_request_units, null)
      max_write_request_units = try(var.settings.on_demand_throughput.max_write_request_units, null)
    }
  }

  dynamic "warm_throughput" {
    for_each = can(var.settings.warm_throughput) ? [1] : []
    content {
      read_units_per_second  = try(var.settings.warm_throughput.read_units_per_second, null)
      write_units_per_second = try(var.settings.warm_throughput.write_units_per_second, null)
    }
  }

  tags = local.tags
}
