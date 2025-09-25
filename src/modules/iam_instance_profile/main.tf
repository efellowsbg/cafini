resource "aws_iam_instance_profile" "main" {
  name       = try(var.settings.name, null)
  name_prefix = try(var.settings.name_prefix, null)
  path       = try(var.settings.path, null)
  role       = try(var.settings.role, null)

  tags = merge(
    {
      Name = try(var.settings.name, null)
    },
    local.tags
  )
}
