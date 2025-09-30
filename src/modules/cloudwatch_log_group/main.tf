resource "aws_cloudwatch_log_group" "main" {
  name              = var.settings.name
  region            = try(var.settings.region, null)
  name_prefix       = try(var.settings.name_prefix, null)
  skip_destroy      = try(var.settings.skip_destroy, null)
  log_group_class   = try(var.settings.log_group_class, null)
  retention_in_days = try(var.settings.retention_in_days, null)
  kms_key_id        = local.kms_key_id
  tags              = local.tags
}
