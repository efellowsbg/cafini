resource "aws_organizations_policy" "main" {
  name    = var.settings.name
  content = jsonencode(var.settings.content)

  description  = try(var.settings.description, null)
  type         = try(var.settings.type, null)
  skip_destroy = try(var.settings.skip_destroy, null)

  tags = local.tags
}
