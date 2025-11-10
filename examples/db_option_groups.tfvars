db_option_groups = {
  test_db_option_group = {
    engine_name              = "mysql"
    major_engine_version     = "8.0"
    option_group_description = "Example option group for MySQL"
    skip_destroy             = false
    options = {
      audit_plugin = {
        option_name                         = "AUDIT_PLUGIN"
        port                                = 3306
        version                             = "1.0"
        vpc_security_group_memberships_refs = ["sg_test1", "sg_test2"]

        option_settings = {
          setting1 = {
            name  = "SERVER_AUDIT_EVENTS"
            value = "CONNECT,QUERY"
          }
          setting2 = {
            name  = "SERVER_AUDIT_EXCL_USERS"
            value = "rdsadmin"
          }
        }
      }
    }
  }
}

# pre-requisites
security_groups = {
  sg_test1 = {
    vpc_ref = "vpc_test"
    name    = "test-sg1"

    ingress = {
      http = {
        description = "Allow HTTP from anywhere"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ssh = {
        description = "Allow SSH from office"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["203.0.113.10/32"]
      }
    }
  }

  sg_test2 = {
    vpc_ref = "vpc_test"
    name    = "test-sg2"

    ingress = {
      https = {
        description = "Allow HTTPS from anywhere"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      postgres = {
        description = "Allow Postgres from VPC subnet"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
      }
    }
  }
}

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
