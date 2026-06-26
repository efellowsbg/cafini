resource "aws_iam_openid_connect_provider" "main" {
  url             = var.settings.url
  client_id_list  = var.settings.client_id_list
  thumbprint_list = try(var.settings.thumbprint_list, null)
  tags            = local.tags
}
