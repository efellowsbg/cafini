resource "aws_internet_gateway" "main" {
  vpc_id = try(
    var.settings.vpc_id,
    try(var.resources.vpc[each.key].id, null),
    null
  )

  region = try(var.settings.region, null)
  tags   = local.tags
}
