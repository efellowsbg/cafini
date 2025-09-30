output "id" {
  value = aws_vpc.main.id
}

output "arn" {
  value = aws_vpc.main.arn
}

output "subnets" {
  value = {
    for subnet_ref, _ in var.settings.subnets :
    subnet_ref => aws_subnet.main[subnet_ref]
  }
}
