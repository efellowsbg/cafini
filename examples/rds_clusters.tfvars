rds_clusters = {
  test_cluster = {
    engine                       = "aurora-mysql"
    engine_version               = "8.0.mysql_aurora.3.04.0"
    engine_mode                  = "provisioned"
    cluster_identifier           = "my-aurora-cluster"
    monitoring_role_ref          = "role_test"
    kms_key_ref                  = "kms_keys_test"
    backup_retention_period      = 7
    preferred_backup_window      = "03:00-04:00"
    preferred_maintenance_window = "sun:05:00-sun:06:00"
    master_username              = "admin"
    master_password              = "SuperSecret123!"
    performance_insights_enabled = true
    vpc_security_group_ids = [
      "sg_test"
    ]
    availability_zones = [
      "eu-west-1a",
      "eu-west-1b",
      "eu-west-1c"
    ]
    db_cluster_instance_class = "db.r6g.large"
    s3_import = {
      bucket_ref         = "test_bucket"
      ingestion_role_ref = "role_test"
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
