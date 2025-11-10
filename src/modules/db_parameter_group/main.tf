resource "aws_db_parameter_group" "main" {
  family       = var.settings.family
  region       = try(var.settings.region, null)
  name         = try(var.settings.name, null)
  name_prefix  = try(var.settings.name_prefix, null)
  description  = try(var.settings.description, null)
  skip_destroy = try(var.settings.description, null)
  tags         = local.tags

  dynamic "parameter" {
    for_each = try(var.settings.parameters, {})
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = try(parameter.value.apply_method, null)
    }
  }
}
