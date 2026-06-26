locals {
  security_group_id = try(
    var.resources.security_groups[var.settings.security_group_ref].id,
    try(var.settings.security_group_id, null)
  )

  source_security_group_id = try(
    var.resources.security_groups[var.settings.source_security_group_ref].id,
    try(var.settings.source_security_group_id, null)
  )
}
