resource "aws_security_group" "main" {
  # TODO: add dynamic blocks and missing attributes
  name                   = try(var.settings.name, null)
  name_prefix            = try(var.settings.name_prefix, null)
  description            = try(var.settings.description, null)
  vpc_id                 = try(var.settings.vpc_id, null)
  revoke_rules_on_delete = try(var.settings.revoke_rules_on_delete, null)
  region                 = try(var.settings.region, null)
  tags                   = local.tags
}
