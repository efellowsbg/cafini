resource "aws_route53_record" "main" {
  zone_id                          = var.settings.zone_id
  name                             = var.settings.name
  type                             = var.settings.type
  ttl                              = try(var.settings.ttl, null)
  records                          = try(var.settings.records, null)
  set_identifier                   = try(var.settings.set_identifier, null)
  health_check_id                  = try(var.settings.health_check_id, null)
  multivalue_answer_routing_policy = try(var.settings.multivalue_answer_routing_policy, null)
  allow_overwrite                  = try(var.settings.allow_overwrite, null)

  dynamic "alias" {
    for_each = try(var.settings.alias, null) != null ? [var.settings.alias] : []
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }
}
