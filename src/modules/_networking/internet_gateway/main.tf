resource "aws_internet_gateway" "main" {
  vpc_id = try(
    var.settings.vpc_id,
    null
  )

  tags = local.tags
}
