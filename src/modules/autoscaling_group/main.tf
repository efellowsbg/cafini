resource "aws_autoscaling_group" "main" {
  max_size = var.settings.max_size
  min_size = var.settings.min_size
  region   = try(var.settings.region, null)
}
