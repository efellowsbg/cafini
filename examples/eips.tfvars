eips = {
  eip_test = {
    domain = "vpc"
    tags = {
      Name = "eip-test"
    }

    # Optional references
    # instance_ref          = "ec2_test"
    # network_interface_ref = "eni_test"
    # ipam_pool_ref         = "ipam_test"
  }
}
