security_groups = {
  sg_test = {
    vpc_ref = "vpc_test"
    name    = "test-sg"

    # ingress = [
    #   {
    #     description = "Allow HTTP"
    #     from_port   = 80
    #     to_port     = 80
    #     protocol    = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    #   },
    #   {
    #     description = "Allow HTTPS"
    #     from_port   = 443
    #     to_port     = 443
    #     protocol    = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    #   }
    # ]

    # egress = [
    #   {
    #     description = "Allow all outbound"
    #     from_port   = 0
    #     to_port     = 0
    #     protocol    = "-1"
    #     cidr_blocks = ["0.0.0.0/0"]
    #   }
    # ]
  }
}
