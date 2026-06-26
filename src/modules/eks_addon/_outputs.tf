output "addon_name" {
  value = try(aws_eks_addon.main.addon_name, null)
}

output "arn" {
  value = try(aws_eks_addon.main.arn, null)
}

output "cluster_name" {
  value = try(aws_eks_addon.main.cluster_name, null)
}

output "id" {
  value = try(aws_eks_addon.main.id, null)
}
