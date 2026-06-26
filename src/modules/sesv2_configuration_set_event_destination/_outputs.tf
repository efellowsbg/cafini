output "id" {
  value = try(aws_sesv2_configuration_set_event_destination.main.id, null)
}
