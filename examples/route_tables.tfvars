route_tables = {
  rtb_test = {
    vpc_ref = "vpc_test"

    # Example routes (commented out for now)
    # routes = [
    #   {
    #     cidr_block  = "0.0.0.0/0"
    #     gateway_ref = "igw_test"
    #   },
    #   {
    #     cidr_block      = "10.0.1.0/24"
    #     nat_gateway_ref = "nat_test"
    #   }
    # ]

    tags = {
      Name = "test-rtb"
    }
  }
}
