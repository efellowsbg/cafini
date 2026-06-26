output "associated_at" {
  value = try(aws_eks_access_policy_association.main.associated_at, null)
}

output "cluster_name" {
  value = try(aws_eks_access_policy_association.main.cluster_name, null)
}

output "id" {
  value = try(aws_eks_access_policy_association.main.id, null)
}

output "modified_at" {
  value = try(aws_eks_access_policy_association.main.modified_at, null)
}

output "principal_arn" {
  value = try(aws_eks_access_policy_association.main.principal_arn, null)
}
