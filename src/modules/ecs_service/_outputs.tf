output "id" {
  value = aws_ecs_service.main.id
}

output "arn" {
  value = aws_ecs_service.main.arn
}

output "name" {
  value = aws_ecs_service.main.name
}

output "cluster" {
  value = aws_ecs_service.main.cluster
}

output "tags" {
  value = aws_ecs_service.main.tags_all
}
