module "route53_records" {
  source   = "./modules/route53_record"
  for_each = var.route53_records

  settings        = each.value
  global_settings = local.global_settings
  resources       = {}
}
