resource "aws_route_table_association" "main" {
  route_table_id = local.route_table_id
  subnet_id      = try(local.subnet_id, null)
  gateway_id     = try(local.gateway_id, null)
}
