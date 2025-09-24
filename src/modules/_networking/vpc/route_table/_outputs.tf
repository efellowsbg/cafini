output "route_table_id" {
  value = aws_route_table.main.id
}

output "route_table_arn" {
  value = aws_route_table.main.arn
}

output "route_table_owner_id" {
  value = aws_route_table.main.owner_id
}

output "route_table_tags_all" {
  value = aws_route_table.main.tags_all
}