resource "aws_efs_file_system" "main" {
  creation_token         = try(var.settings.creation_token, null)
  performance_mode       = try(var.settings.performance_mode, null)
  throughput_mode        = try(var.settings.throughput_mode, null)
  region                 = try(var.settings.region, null)
  availability_zone_name = try(var.settings.availability_zone_name, null)

  # --- Encryption ---
  encrypted  = try(var.settings.encrypted, false)
  kms_key_id = try(local.kms_key_id, null)

  # --- Provisioned Throughput ---
  provisioned_throughput_in_mibps = try(var.settings.provisioned_throughput_in_mibps, null)

  # --- Tags ---
  tags = local.tags

  dynamic "lifecycle_policy" {
    for_each = try(var.settings.lifecycle_policy, [])
    content {
      transition_to_archive               = try(lifecycle_policy.value.transition_to_archive, null)
      transition_to_ia                    = try(lifecycle_policy.value.transition_to_ia, null)
      transition_to_primary_storage_class = try(lifecycle_policy.value.transition_to_primary_storage_class, null)
    }
  }

  dynamic "protection" {
    for_each = try(var.settings.protection, [])
    content {
      replication_overwrite = try(protection.value.replication_overwrite, null)
    }
  }
}
