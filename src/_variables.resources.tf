variable "cloudwatch_log_groups" { default = {} }

variable "iam_users" { default = {} }

variable "iam_groups" { default = {} }

variable "iam_roles" { default = {} }

variable "iam_policies" { default = {} }

variable "vpcs" { default = {} }

variable "internet_gateways" { default = {} }

variable "nat_gateways" { default = {} }

variable "route_tables" { default = {} }

variable "route_table_associations" { default = {} }

variable "security_groups" { default = {} }

variable "vpc_endpoints" { default = {} }

variable "eips" { default = {} }

variable "kms_keys" { default = {} }

variable "iam_instance_profiles" { default = {} }

variable "secretsmanager_secrets" { default = {} }

variable "db_subnet_groups" { default = {} }

variable "launch_templates" { default = {} }

variable "ec2_instances" { default = {} }

variable "iam_policy_attachments" { default = {} }

variable "autoscaling_groups" { default = {} }

variable "lambda_functions" { default = {} }

variable "s3_buckets" { default = {} }

variable "s3_bucket_lifecycle_configurations" { default = {} }

variable "s3_bucket_policies" { default = {} }

variable "eks_node_groups" { default = {} }

variable "eks_clusters" { default = {} }

variable "ecs_services" { default = {} }

variable "ecs_clusters" { default = {} }

variable "efs_file_systems" { default = {} }

variable "budgets_budgets" { default = {} }

variable "dynamodb_tables" { default = {} }

variable "cloudtrails" { default = {} }

variable "organizations_accounts" { default = {} }

variable "organizations_policies" { default = {} }

variable "config_config_rules" { default = {} }

variable "sns_topics" { default = {} }

variable "cloudwatch_metric_alarms" { default = {} }
