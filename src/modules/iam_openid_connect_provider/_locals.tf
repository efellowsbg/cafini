locals {
  tags = merge(
    try(var.global_settings.tags, {}),
    try(var.settings.tags, {})
  )
}
