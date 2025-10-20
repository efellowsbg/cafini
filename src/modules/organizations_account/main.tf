resource "aws_organizations_account" "main" {
  name  = var.settings.name
  email = var.settings.email

  close_on_deletion          = try(var.settings.close_on_deletion, null)
  create_govcloud            = try(var.settings.create_govcloud, null)
  iam_user_access_to_billing = try(var.settings.iam_user_access_to_billing, null)
  parent_id                  = try(var.settings.parent_id, null)
  role_name                  = try(var.settings.role_name, null)

  tags = local.tags
}
