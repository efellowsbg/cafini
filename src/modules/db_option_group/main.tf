resource "aws_db_option_group" "main" {
  engine_name              = var.settings.engine_name
  major_engine_version     = var.settings.major_engine_version
  region                   = try(var.settings.region, null)
  name                     = try(var.settings.name, null)
  name_prefix              = try(var.settings.name_prefix, null)
  option_group_description = try(var.settings.option_group_description, null)
  skip_destroy             = try(var.settings.skip_destroy, null)
  tags                     = local.tags

  dynamic "option" {
    for_each = try(var.settings.options, {})
    content {
      option_name                    = option.value.option_name
      port                           = try(parameter.value.port, null)
      version                        = try(parameter.value.version, null)
      db_security_group_memberships  = try(parameter.value.db_security_group_memberships, null)
      vpc_security_group_memberships = try(parameter.value.vpc_security_group_memberships, null)

      dynamic "option_settings" {
        for_each = try(option.value.option_settings, {})
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }
}
