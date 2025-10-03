nat_gateways = {
  nat_test = {
    allocation_ref = "eip_test"
    subnet_ref     = "vpc_test/subnet_test"
    tags = {
      Name = "nat-test"
    }
  }
}
