directory_service_directories = {
  test_dir = {
    name     = "corp.notexample.com"
    password = "SuperSecretPassw0rd"
    size     = "Small"
    type     = "SimpleAD"

    vpc_settings = {
      vpc_ref     = "vpc_test"
      subnet_refs = ["subnet_test1", "subnet_test2"]
    }

    tags = {
      Project = "test"
    }
  }
}

# pre-requisites
vpcs = {
  vpc_test = {
    name       = "vpc-test"
    cidr_block = "10.0.0.0/16"

    subnets = {
      subnet_test1 = {
        cidr_block = "10.0.1.0/24"
      }
      subnet_test2 = {
        cidr_block = "10.0.2.0/24"
      }
    }
  }
}
