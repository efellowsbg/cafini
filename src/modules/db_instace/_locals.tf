locals {
  # insufficient_data_actions = (
  #   length(try(var.settings.insufficient_data_actions_refs, [])) > 0 ?
  #   [for ref in var.settings.insufficient_data_actions_refs : var.resources.sns_topics[ref].arn] :
  #   try(var.settings.insufficient_data_actions, null)
  # )

  # ok_actions = (
  #   length(try(var.settings.ok_actions_refs, [])) > 0 ?
  #   [for ref in var.settings.ok_actions_refs : var.resources.sns_topics[ref].arn] :
  #   try(var.settings.ok_actions, null)
  # )

  # alarm_actions = (
  #   length(try(var.settings.alarm_actions_refs, [])) > 0 ?
  #   [for ref in var.settings.alarm_actions_refs : var.resources.sns_topics[ref].arn] :
  #   try(var.settings.alarm_actions, null)
  # )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
