output "id" {
  value       = { for k, igw in aws_internet_gateway.main : k => igw.id }
}

output "arn" {
  value       = { for k, igw in aws_internet_gateway.main : k => igw.arn }
}