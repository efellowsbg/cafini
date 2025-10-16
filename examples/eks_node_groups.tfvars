eks_node_groups = {
  test_node_group = {
    cluster_ref   = "example_cluster"
    node_role_ref = "role_test"
    subnet_ref    = "vpc_test/subnet_test"
    #launch_template_ref = "example_templ"
    node_group_name = "example-node-group"
    version         = "1.29"
    capacity_type   = "ON_DEMAND"
    instance_types  = ["t3.micro"]
    disk_size       = 20
    region          = "eu-central-1"

    scaling_config = {
      desired_size = 2
      max_size     = 3
      min_size     = 1
    }

    update_config = {
      max_unavailable = 1
    }

    # remote_access = {
    #   ec2_ssh_key                = "test-key-pair"
    #   source_security_group_refs = ["sg_test"]
    # }

    node_repair_config = {
      enabled = true
    }
  }
}
