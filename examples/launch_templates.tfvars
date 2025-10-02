launch_templates = {
  example_templ = {
    name_prefix   = "example-test"
    image_id      = "ami-0abcdef1234567890"
    instance_type = "t3.micro"
    key_name      = "test-key-pair"
    network_interfaces = [
      {
        device_index                = 0
        subnet_ref                  = "vpc_test/subnet_test"
        associate_public_ip_address = true
      }
    ]
    tags = {
      Environment = "dev"
      Project     = "cafini"
    }
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
