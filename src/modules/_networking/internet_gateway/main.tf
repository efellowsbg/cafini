resource "aws_internet_gateway" "main" {
  vpc_id = local.vpc_id
  tags   = local.tags
}
