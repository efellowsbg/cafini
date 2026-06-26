output "access_entry_arn" {
  value = try(aws_eks_access_entry.main.access_entry_arn, null)
}

output "cluster_name" {
  value = try(aws_eks_access_entry.main.cluster_name, null)
}

output "id" {
  value = try(aws_eks_access_entry.main.id, null)
}

output "principal_arn" {
  value = try(aws_eks_access_entry.main.principal_arn, null)
}
