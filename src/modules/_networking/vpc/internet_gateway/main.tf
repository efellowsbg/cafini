resource "aws_internet_gateway" "main" {
  vpc_id = try(var.settings.vpc_id, null)
  region = try(var.settings.region, null)
  
  tags = merge(
    {
      Name = try(var.settings.name, null)
    },
    local.tags
  )
}