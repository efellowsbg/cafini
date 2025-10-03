resource "aws_security_group" "main" {
  name                   = try(var.settings.name, null)
  name_prefix            = try(var.settings.name_prefix, null)
  description            = try(var.settings.description, "Managed by CAF")
  vpc_id                 = local.vpc_id
  revoke_rules_on_delete = try(var.settings.revoke_rules_on_delete, null)
  region                 = try(var.settings.region, null)
  tags                   = local.tags

  # 🔹 Ingress rules
  dynamic "ingress" {
    for_each = try(var.settings.ingress, [])
    content {
      description      = try(ingress.value.description, null)
      from_port        = try(ingress.value.from_port, null)
      to_port          = try(ingress.value.to_port, null)
      protocol         = try(ingress.value.protocol, null)
      cidr_blocks      = try(ingress.value.cidr_blocks, null)
      ipv6_cidr_blocks = try(ingress.value.ipv6_cidr_blocks, null)
      security_groups  = try(ingress.value.security_groups, null)
      self             = try(ingress.value.self, null)
    }
  }

  # 🔹 Egress rules
  dynamic "egress" {
    for_each = try(var.settings.egress, [])
    content {
      description      = try(egress.value.description, null)
      from_port        = try(egress.value.from_port, null)
      to_port          = try(egress.value.to_port, null)
      protocol         = try(egress.value.protocol, null)
      cidr_blocks      = try(egress.value.cidr_blocks, null)
      ipv6_cidr_blocks = try(egress.value.ipv6_cidr_blocks, null)
      security_groups  = try(egress.value.security_groups, null)
      self             = try(egress.value.self, null)
    }
  }
}
