output "id" {
  value = aws_eks_node_group.main.id
}

output "arn" {
  value = aws_eks_node_group.main.arn
}

output "status" {
  value = aws_eks_node_group.main.status
}

output "name" {
  value = aws_eks_node_group.main.node_group_name
}
