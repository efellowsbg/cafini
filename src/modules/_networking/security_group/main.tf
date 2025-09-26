resource "aws_security_group" "main" {
# TODO: add dynamic blocks and missing attributes
  name                   = try(var.settings.name, null)
  name_prefix            = try(var.settings.name_prefix, null)
  description            = try(var.settings.description, null)
  vpc_id                 = try(var.settings.vpc_id, null)
  revoke_rules_on_delete = try(var.settings.revoke_rules_on_delete, null)
  region                 = try(var.settings.region, null)
  tags =local.tags  
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each          = try({ for k, v in var.settings.ingress : k => v }, {})
  security_group_id = aws_security_group.main.id

  cidr_ipv4    = try(each.value.cidr_ipv4, null)
  cidr_ipv6    = try(each.value.cidr_ipv6, null)
  from_port    = each.value.from_port
  to_port      = each.value.to_port
  ip_protocol  = each.value.protocol
  description  = try(each.value.description, null)
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each          = try({ for k, v in var.settings.egress : k => v }, {})
  security_group_id = aws_security_group.main.id

  cidr_ipv4    = try(each.value.cidr_ipv4, null)
  cidr_ipv6    = try(each.value.cidr_ipv6, null)
  from_port    = each.value.from_port
  to_port      = each.value.to_port
  ip_protocol  = each.value.protocol
  description  = try(each.value.description, null)
}