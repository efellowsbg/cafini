output "id" {
  value       = { for k, ngw in aws_nat_gateway.main : k => ngw.id }
}

output "network_interface_id" {
  value       = { for k, ngw in aws_nat_gateway.main : k => ngw.network_interface_id }
}
