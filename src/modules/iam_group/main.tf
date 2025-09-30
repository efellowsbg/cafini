resource "aws_iam_group" "main" {
  name = var.settings.name
  path = try(var.settings.path, null)
}
