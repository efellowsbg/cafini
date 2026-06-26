output "id" {
  value = try(aws_route.main.id, null)
}

output "route_table_id" {
  value = try(aws_route.main.route_table_id, null)
}
