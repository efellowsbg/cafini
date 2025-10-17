ecs_services = {
  example_service = {
    name         = "caf-ecs-service"
    cluster_ref  = "example_cluster"
    iam_role_ref = "ecs_service_role"

    # task_definition_ref = "ecs_task_def_example" Module does not exist yet

    # ECS runtime configuration
    desired_count                      = 2
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"
    platform_version                   = "LATEST"
    enable_ecs_managed_tags            = true
    enable_execute_command             = true
    force_new_deployment               = false
    wait_for_steady_state              = false
    propagate_tags                     = "SERVICE"
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100

    # deployment_configuration = {
    #   strategy             = "ROLLING"
    #   bake_time_in_minutes = 5
    # }

    # Subnet and security group references
    subnet_ref          = "vpc_test/subnet_test"
    security_group_refs = ["sg_test"]

    network_configuration = {
      assign_public_ip = true
    }

    # load_balancers = [
    #   {
    #     target_group_arn = "arn:aws:elasticloadbalancing:eu-central-1:123456789012:targetgroup/example-tg/abcd1234efgh5678"
    #     container_name   = "app"
    #     container_port   = 80
    #   }
    # ]

    deployment_circuit_breaker = {
      enable   = true
      rollback = true
    }

    tags = {
      Environment = "dev"
      Project     = "cafini"
    }
  }
}
