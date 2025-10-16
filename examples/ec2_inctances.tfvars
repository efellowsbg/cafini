ec2_instances = {
  example_ec2 = {
    ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    name_prefix   = "example-ec2"
    instance_type = "t3.micro"
    key_name      = "test-key-pair"
    subnet_ref    = "vpc_test/subnet_test"
    private_ip    = "10.0.1.1"
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
