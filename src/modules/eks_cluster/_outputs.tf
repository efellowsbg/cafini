output "id" {
  value = aws_eks_cluster.main.id
}

output "arn" {
  value = aws_eks_cluster.main.arn
}

output "name" {
  value = aws_eks_cluster.main.name
}

output "endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "version" {
  value = aws_eks_cluster.main.version
}
