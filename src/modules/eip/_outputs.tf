output "eip_id" {
  value = aws_eip.main.id
}

output "eip_allocation_id" {
  value = aws_eip.main.allocation_id
}

output "eip_association_id" {
  value = try(aws_eip.main.association_id, null)
}

output "eip_public_ip" {
  value = aws_eip.main.public_ip
}

output "eip_private_ip" {
  value = try(aws_eip.main.private_ip, null)
}

output "eip_public_dns" {
  value = try(aws_eip.main.public_dns, null)
}

output "eip_private_dns" {
  value = try(aws_eip.main.private_dns, null)
}

output "eip_tags_all" {
  value = aws_eip.main.tags_all
}
