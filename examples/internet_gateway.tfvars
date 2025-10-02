internet_gateways = {
  igw1 = {
    vpc_id = module.vpcs["vpc_test"].aws_vpc.main.id
    tags = {
      Name = "igw1"
    }
  }
}