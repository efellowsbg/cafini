resource "aws_db_subnet_group" "main" {
  subnet_ids  = local.subnet_ids
  name        = try(var.settings.name, null)
  region      = try(var.settings.region, null)
  name_prefix = try(var.settings.name_prefix, null)
  description = try(var.settings.description, null)
  tags        = local.tags
}
