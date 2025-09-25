resource "aws_route_table_association" "main" {
# TODO: Add doublecheck for missing arguments, reference to resources and dynamic blocks
  route_table_id = var.settings.route_table_id
  subnet_id      = try(var.settings.subnet_id, null)
  gateway_id     = try(var.settings.gateway_id, null)
}
