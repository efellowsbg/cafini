module eips {
    source = "../modules/eip"
    for_each = var.eips

    settings        = each.value
    global_settings = local.global_settings

    # client_config = {
    #   landingzone_key = var.landingzone.key
    # }
}