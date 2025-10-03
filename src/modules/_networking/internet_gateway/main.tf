resource "aws_internet_gateway" "main" {
  vpc_id = try(
    var.resources.vpc.id, # reference to a VPC resource
    var.settings.vpc_id,  # direct vpc_id value
    null
  )

  tags = local.tags
}
