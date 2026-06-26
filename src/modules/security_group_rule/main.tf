resource "aws_security_group_rule" "main" {
  type                     = var.settings.type
  security_group_id        = local.security_group_id
  from_port                = try(var.settings.from_port, null)
  to_port                  = try(var.settings.to_port, null)
  protocol                 = try(var.settings.protocol, null)
  cidr_blocks              = try(var.settings.cidr_blocks, null)
  ipv6_cidr_blocks         = try(var.settings.ipv6_cidr_blocks, null)
  prefix_list_ids          = try(var.settings.prefix_list_ids, null)
  self                     = try(var.settings.self, null)
  source_security_group_id = local.source_security_group_id
  description              = try(var.settings.description, null)
}
