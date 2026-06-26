locals {
  configuration_set_name = try(
    var.resources.sesv2_configuration_sets[var.settings.configuration_set_ref].configuration_set_name,
    try(var.settings.configuration_set_name, null)
  )
}
