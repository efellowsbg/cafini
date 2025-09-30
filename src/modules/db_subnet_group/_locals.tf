locals {
  subnet_ids = length(try(var.settings.subnet_refs, [])) > 0 ? [
    for data in var.settings.subnet_refs :
    var.resources.vpcs[
      split("/", data)[0]
      ].subnets[
      split("/", data)[1]
    ].id
  ] : var.settings.subnet_ids

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
