resource "aws_internet_gateway" "main" {
  for_each = var.resources.vpc

  vpc_id = try(
    var.settings.vpc_id,
    try(each.value.id, null),
    null
  )

  tags   = local.tags
}
