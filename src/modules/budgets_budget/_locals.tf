locals {
  tags = merge(
    try(var.global_settings.default_tags, {}),
    try(var.settings.tags, {})
  )
}
