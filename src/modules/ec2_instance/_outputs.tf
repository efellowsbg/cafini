output "id" {
  value = aws_instance.main.id
}

output "arn" {
  value = aws_instance.main.arn
}

output "primary_network_interface_id" {
  value = aws_instance.main.primary_network_interface_id
}

output "public_ip" {
  value = aws_instance.main.public_ip
}
