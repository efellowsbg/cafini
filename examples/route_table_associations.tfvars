route_table_associations = {
  rtb_assoc_test = {
    route_table_ref = "rtb_test"
    subnet_ref      = "vpc_test/subnet_test"
    tags = {
      Name = "test-rtb-assoc"
    }
  }

  # Gateway association
  # rtb_assoc_gateway = {
  #   route_table_ref = "rtb_test"
  #   gateway_ref     = "igw_test"
  #   tags = {
  #     Name = "rtb-assoc-gateway"
  #   }
  # }
}
