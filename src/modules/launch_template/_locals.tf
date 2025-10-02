locals {
  key_name = try(
    var.resources.key_pairs[var.settings.key_name_ref].key_name,
    try(var.settings.key_name, null)
  )

  security_group_names = [
    for sg_ref in try(var.settings.security_group_names_ref, []) : try(
      var.resources.security_groups[sg_ref].name,
      null
    )
  ]

  vpc_security_group_ids = [
    for sg_ref in try(var.settings.vpc_security_group_ids_ref, []) : try(
      var.resources.security_groups[sg_ref].id,
      null
    )
  ]

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

  iam_instance_profile_arn = try(
    var.resources.iam_instance_profiles[var.settings.iam_instance_profile.arn_ref].arn,
    try(var.settings.iam_instance_profile.arn, null)
  )

  iam_instance_profile_name = try(
    var.resources.iam_instance_profiles[var.settings.iam_instance_profile.name_ref].name,
    try(var.settings.iam_instance_profile.name, null)
  )

  placement_group_name = try(
    var.resources.placement_groups[var.settings.placement.group_name_ref].name,
    try(var.settings.placement.group_name, null)
  )

  placement_group_id = try(
    var.resources.placement_groups[var.settings.placement.group_id_ref].id,
    try(var.settings.placement.group_id, null)
  )

  placement_host = try(
    var.resources.ec2_hosts[var.settings.placement.host_ref].id,
    try(var.settings.placement.host_id, null)
  )

  placement_host_rg = try(
    var.resources.resourcegroups_groups[var.settings.placement.host_resource_group_ref].arn,
    try(var.settings.placement.host_resource_group_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
