output "association_arn" {
  value = try(aws_eks_pod_identity_association.main.association_arn, null)
}

output "association_id" {
  value = try(aws_eks_pod_identity_association.main.association_id, null)
}

output "id" {
  value = try(aws_eks_pod_identity_association.main.id, null)
}
