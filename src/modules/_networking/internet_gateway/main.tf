resource "aws_internet_gateway" "main" {
# TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  vpc_id = try(
    var.settings.vpc_id,
    try(var.resources.vpc[each.key].id, null),
    null
  )

  region = try(var.settings.region, null)
  tags   = local.tags
}