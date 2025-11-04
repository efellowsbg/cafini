db_instances = {
  db_test = {
    instance_class             = "db.t3.medium"
    engine                     = "mysql"
    engine_version             = "8.0.34"
    allocated_storage          = 20
    db_name                    = "mydb"
    identifier                 = "my-db-instance"
    username                   = "admin"
    password                   = "Password123!"
    port                       = 3306
    multi_az                   = false
    publicly_accessible        = true
    storage_encrypted          = true
    storage_type               = "gp3"
    ca_cert_identifier         = "rds-ca-2019"
    backup_retention_period    = 7
    backup_window              = "03:00-06:00"
    maintenance_window         = "Mon:07:00-Mon:08:00"
    auto_minor_version_upgrade = true
    apply_immediately          = true
    domain_iam_role_ref        = "role_test"
    s3_import = {
      bucket_ref         = "test_bucket"
      ingestion_role_ref = "role_test"
    }
    blue_green_update = {
      enabled = false
    }
    tags = {
      Environment = "test"
      Project     = "terraform-test"
    }
  }

  db_test_2 = {
    instance_class             = "db.t3.medium"
    engine                     = "mysql"
    engine_version             = "8.0.34"
    allocated_storage          = 20
    db_name                    = "mydb2"
    identifier                 = "my-db-instance2"
    username                   = "admin2"
    password                   = "Password123!2"
    port                       = 3306
    multi_az                   = false
    publicly_accessible        = true
    storage_encrypted          = true
    storage_type               = "gp3"
    ca_cert_identifier         = "rds-ca-2019"
    backup_retention_period    = 7
    backup_window              = "03:00-06:00"
    maintenance_window         = "Mon:07:00-Mon:08:00"
    auto_minor_version_upgrade = true
    apply_immediately          = true
    domain_iam_role_ref        = "role_test"
    blue_green_update = {
      enabled = false
    }
    vpc_security_group_refs = ["sg_test"]
    kms_key_ref             = "kms_keys_test"
    tags = {
      Environment = "test"
    }
  }
}

# pre-requisites
iam_roles = {
  role_test = {
    name                     = "test-role"
    description              = "Example IAM role"
    assume_principals        = ["ec2.amazonaws.com"]
    permissions_boundary_ref = "policy_boundary_test"
    max_session_duration     = 3600
  }
}

kms_keys = {
  kms_keys_test = {
    description             = "KMS key using referenced IAM policy"
    key_usage               = "ENCRYPT_DECRYPT"
    enable_key_rotation     = true
    deletion_window_in_days = 30
    multi_region            = true
    policy_ref              = "policy_assume_test"
  }
}

s3_buckets = {
  test_bucket = {
    bucket        = "martin-caf-bucket"
    force_destroy = true
    kms_key_ref   = "kms_keys_test"
    server_side_encryption_configuration = {
      sse_algorithm      = "aws:kms"
      bucket_key_enabled = true
    }
    lifecycle_rules = [
      {
        id         = "expire-30-days"
        enabled    = true
        expiration = { days = 30 }
      }
    ]
  }
}

secretsmanager_secrets = {
  smng_secret_test = {
    name = "smng_secret_test"

    replicas = {
      replica_test = {
        region = "us-east-1"
      }
    }
  }
}

security_groups = {
  sg_test = {
    vpc_ref = "vpc_test"
    name    = "test-sg"

    ingress = [
      {
        description = "Allow HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Allow HTTPS"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]

    egress = [
      {
        description = "Allow all outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}
