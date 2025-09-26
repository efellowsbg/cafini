resource "aws_route_table_association" "main" {
  # TODO: Doublecheck for missing arguments, reference to resources and dynamic blocks
  route_table_id = try(
    var.settings.route_table_id,
    try(var.resources.route_table[each.key].id, null),
    null
  )

  subnet_id = try(
    var.settings.subnet_id,
    try(var.resources.subnet[each.key].id, null),
    null
  )

  gateway_id = try(
    var.settings.gateway_id,
    try(var.resources.igw[each.key].id, try(var.resources.vgw[each.key].id, null)),
    null
  )
}
