db_subnet_groups = {
  dbg_test = {
    name        = "dbg-test"
    subnet_refs = ["vpc_test/subnet_test"]
    description = "This is test DB subnet group"
  }
}


# pre-requisites
vpcs = {
  vpc_test = {
    name       = "vpc-test"
    cidr_block = "10.0.0.0/16"

    subnets = {
      subnet_test = {
        cidr_block = "10.0.1.0/24"
      }
    }
  }
}
