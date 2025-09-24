module route_table_associations {
    source = "../../modules/_networking/vpc/route_table_association"
    for_each = var.route_table_associations

    settings        = each.value
    global_settings = local.global_settings
    
    # client_config = {
    #   landingzone_key = var.landingzone.key
    # }
}