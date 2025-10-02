locals {
  availability_zone = try(
    var.resources.availability_zones[var.settings.availability_zone_ref].id,
    try(var.settings.availability_zone, null)
  )

  capacity_reservation_id = try(
    var.resources.ec2_capacity_reservations[
      var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_ref
    ].id,
    try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_id, null)
  )

  capacity_reservation_resource_group_arn = try(
    var.resources.ec2_capacity_reservations[
      var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_resource_group_ref
    ].arn,
    try(var.settings.capacity_reservation_specification.capacity_reservation_target.capacity_reservation_resource_group_arn, null)
  )

  key_name = try(
    var.resources.key_pairs[var.settings.key_name_ref].key_name,
    try(var.settings.key_name, null)
  )

  # security_group_names = length(try(var.settings.security_group_names_ref, [])) > 0 ? [
  #   for sg_ref in try(var.settings.security_group_names_ref, []) : try(
  #     var.resources.security_groups[sg_ref].name,
  #     null
  #   )
  # ] : try(var.settings.security_group_names, null)

  vpc_security_group_ids = length(try(var.settings.vpc_security_group_ids_ref, [])) > 0 ? [
    for sg_ref in try(var.settings.vpc_security_group_ids_ref, []) : try(
      var.resources.security_groups[sg_ref].name,
      null
    )
  ] : try(var.settings.vpc_security_group_ids, null)


  # iam_instance_profile_arn = try(
  #   var.resources.iam_instance_profiles[var.settings.iam_instance_profile.arn_ref].arn,
  #   try(var.settings.iam_instance_profile.arn, null)
  # )


  # placement_group_name = try(
  #   var.resources.placement_groups[var.settings.placement.group_name_ref].name,
  #   try(var.settings.placement.group_name, null)
  # )

  # placement_group_id = try(
  #   var.resources.placement_groups[var.settings.placement.group_id_ref].id,
  #   try(var.settings.placement.group_id, null)
  # )

  placement_group_name = try(
    var.resources.placement_groups[var.settings.placement_group_name_ref].name,
    try(var.settings.placement_group_name, null)
  )

  placement_group_id = try(
    var.resources.placement_groups[var.settings.placement_group_id_ref].id,
    try(var.settings.placement_group_id, null)
  )

  launch_template_id = try(
    var.resources.launch_templates[var.settings.launch_template.id_ref].id,
    try(var.settings.launch_template.id, null)
  )

  launch_template_name = try(
    var.resources.launch_templates[var.settings.launch_template.name_ref].name,
    try(var.settings.launch_template.name, null)
  )

  iam_instance_profile = try(
    var.resources.iam_instance_profiles[var.settings.iam_instance_profile_ref].name,
    try(var.settings.iam_instance_profile, null)
  )

  host_id = try(
    var.resources.ec2_hosts[var.settings.host_id_ref].id,
    try(var.settings.host_id, null)
  )

  host_resource_group_arn = try(
    var.resources.resourcegroups_groups[var.settings.host_resource_group_arn_ref].arn,
    try(var.settings.placement.host_resource_group_arn, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
