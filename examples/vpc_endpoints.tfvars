vpc_endpoints = {
  endpoint_test = {
    vpc_ref           = "vpc_test"
    service_name      = "com.amazonaws.eu-central-1.s3"
    vpc_endpoint_type = "Gateway"
    subnet_refs       = ["vpc_test/subnet_test"]
    tags = {
      Name = "endpoint-test"
    }
  }
}
