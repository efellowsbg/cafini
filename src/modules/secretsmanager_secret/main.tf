resource "aws_secretsmanager_secret" "main" {
# Region param suppose to fallback to the default region from the provider if not set
  region              = try(var.settings.region, null) 
  name                = try(var.settings.name, null)
  name_prefix         = try(var.settings.name_prefix, null)
  description         = try(var.settings.description, null)
  kms_key_id          = local.kms_key_id
#TO DO Implement policy referenece
  policy              = try(var.settings.policy, null) 
  force_overwrite_replica_secret              = try(var.settings.force_overwrite_replica_secret, null) 
  tags                = local.tags

  dynamic "replica" {
    for_each = try(var.settings.replicas, {})

    content {
# Region param suppose to fallback to the default region from the provider if not set
      region     = try(replica.value.region, null)
      kms_key_id = try(
        var.resources.kms_keys[replica.value.kms_key_ref].arn,
        try(replica.value.kms_key_id, null)
      )
    }
  }
}