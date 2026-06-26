resource "aws_ssm_parameter" "main" {
  name            = var.settings.name
  type            = var.settings.type
  value           = try(var.settings.value, null)
  insecure_value  = try(var.settings.insecure_value, null)
  description     = try(var.settings.description, null)
  tier            = try(var.settings.tier, null)
  key_id          = local.key_id
  allowed_pattern = try(var.settings.allowed_pattern, null)
  data_type       = try(var.settings.data_type, null)
  overwrite       = try(var.settings.overwrite, null)
  tags            = local.tags
}
