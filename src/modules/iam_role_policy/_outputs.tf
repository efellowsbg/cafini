output "id" {
  value = try(aws_iam_role_policy.main.id, null)
}

output "name" {
  value = try(aws_iam_role_policy.main.name, null)
}

output "policy" {
  value = try(aws_iam_role_policy.main.policy, null)
}

output "role" {
  value = try(aws_iam_role_policy.main.role, null)
}
