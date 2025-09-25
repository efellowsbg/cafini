module "vpc_endpoints" {
  source = "../../modules/_networking/vpc/vpc_endpoint"
  for_each = var.vpc_endpoints

  settings        = each.value
  global_settings = local.global_settings

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}