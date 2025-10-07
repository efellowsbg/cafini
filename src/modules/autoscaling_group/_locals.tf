locals {
  availability_zones = length(try(var.settings.availability_zones_ref, [])) > 0 ? [
    for az_ref in try(var.settings.availability_zones_ref, []) : try(
      var.resources.availability_zones[az_ref].id,
      null
    )
  ] : try(var.settings.availability_zones, null)

  capacity_reservation_ids = length(try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_ids_ref, [])) > 0 ? [
    for cr_ref in try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_ids_ref, []) : try(
      var.resources.ec2_capacity_reservations[cr_ref].id,
      null
    )
  ] : try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_ids, null)

  launch_template_id = try(
    var.resources.launch_templates[var.settings.launch_template.id_ref].id,
    try(var.settings.launch_template.id, null)
  )

  launch_template_name = try(
    var.resources.launch_templates[var.settings.launch_template.name_ref].name,
    try(var.settings.launch_template.name, null)
  )

  launch_configuration = try(
    var.resources.launch_configurations[var.settings.launch_configuration_ref].name,
    try(var.settings.launch_configuration, null)
  )

  mi_policy_launch_template_id = try(
    var.resources.launch_templates[
      var.settings.mixed_instances_policy.launch_template.launch_template_specification.launch_template_id_ref
    ].id,
    try(
      var.settings.mixed_instances_policy.launch_template.launch_template_specification.launch_template_id,
      null
    )
  )

  mi_policy_launch_template_name = try(
    var.resources.launch_templates[
      var.settings.mixed_instances_policy.launch_template.launch_template_specification.launch_template_name_ref
    ].name,
    try(
      var.settings.mixed_instances_policy.launch_template.launch_template_specification.launch_template_name,
      null
    )
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
