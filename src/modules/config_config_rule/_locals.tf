locals {
  source_identifier = try(
    var.resources.lambda_functions[var.settings.source_identifier_ref].arn,
    try(var.settings.source_identifier, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
