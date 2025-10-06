output "id" {
  value = aws_eip.main.id
}

output "public_ip" {
  value = aws_eip.main.public_ip
}

output "carrier_ip" {
  value = aws_eip.main.carrier_ip
}

output "private_ip" {
  value = aws_eip.main.private_ip
}
