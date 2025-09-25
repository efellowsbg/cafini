resource "aws_security_group" "main" {
  name                   = try(var.settings.name, null)
  name_prefix            = try(var.settings.name_prefix, null)
  description            = try(var.settings.description, "Managed by Terraform")
  vpc_id                 = try(var.settings.vpc_id, null)
  revoke_rules_on_delete = try(var.settings.revoke_rules_on_delete, null)
  region                 = try(var.settings.region, null)

  tags = merge(
    {
      Name = try(var.settings.name, null)
    },
    local.tags
  )

  lifecycle {
    create_before_destroy = try(var.settings.create_before_destroy, false)
  }
}