resource "aws_dynamodb_table" "main" {
  name         = var.settings.name
  billing_mode = try(var.settings.billing_mode, null)
  hash_key     = var.settings.hash_key
  range_key    = try(var.settings.range_key, null)
  region       = try(var.settings.region, null)

  read_capacity  = try(var.settings.read_capacity, null)
  write_capacity = try(var.settings.write_capacity, null)
  table_class    = try(var.settings.table_class, null)

  deletion_protection_enabled = try(var.settings.deletion_protection_enabled, false)
  stream_enabled              = try(var.settings.stream_enabled, false)
  stream_view_type            = try(var.settings.stream_view_type, null)

  # --- Attributes ---
  dynamic "attribute" {
    for_each = try(var.settings.attribute, {})
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  # --- Local Secondary Index ---
  dynamic "local_secondary_index" {
    for_each = try(var.settings.local_secondary_index, {})
    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = try(local_secondary_index.value.non_key_attributes, null)
    }
  }

  # --- Global Secondary Index ---
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

  # --- TTL ---
  dynamic "ttl" {
    for_each = can(var.settings.ttl) ? [1] : []
    content {
      attribute_name = try(var.settings.ttl.attribute_name, null)
      enabled        = try(var.settings.ttl.enabled, false)
    }
  }

  # --- Point-in-Time Recovery ---
  dynamic "point_in_time_recovery" {
    for_each = can(var.settings.point_in_time_recovery) ? [1] : []
    content {
      enabled                 = try(var.settings.point_in_time_recovery.enabled, false)
      recovery_period_in_days = try(var.settings.point_in_time_recovery.recovery_period_in_days, null)
    }
  }

  # --- Server-Side Encryption ---
  dynamic "server_side_encryption" {
    for_each = can(var.settings.server_side_encryption) ? [1] : []
    content {
      enabled     = try(var.settings.server_side_encryption.enabled, true)
      kms_key_arn = try(local.kms_key_arn, null)
    }
  }

  tags = local.tags
}
