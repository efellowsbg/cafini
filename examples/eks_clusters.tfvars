eks_clusters = {
  example_cluster = {
    name    = "example-eks-cluster"
    version = "1.31"
    region  = "eu-central-1"

    role_ref            = "role_test"
    subnet_refs         = "vpc_test/subnet_test"
    security_group_refs = ["sg_test"]

    vpc_config = {
      endpoint_private_access = false
      endpoint_public_access  = true
      public_access_cidrs     = ["0.0.0.0/0"]
    }
  }
}
