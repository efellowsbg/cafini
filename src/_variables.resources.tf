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

variable "db_parameter_groups" { default = {} }

variable "db_option_groups" { default = {} }

variable "launch_templates" { default = {} }

variable "ec2_instances" { default = {} }

variable "iam_policy_attachments" { default = {} }

variable "iam_user_policy_attachments" { default = {} }

variable "iam_group_policy_attachments" { default = {} }

variable "iam_role_policy_attachments" { default = {} }

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

variable "config_configuration_recorders" { default = {} }

variable "rds_clusters" { default = {} }

variable "db_instances" { default = {} }

variable "rds_cluster_instances" { default = {} }

variable "directory_service_directories" { default = {} }

variable "ssm_parameters" { default = {} }

variable "sqs_queues" { default = {} }

variable "sqs_queue_policies" { default = {} }

variable "sns_topic_policies" { default = {} }

variable "sns_topic_subscriptions" { default = {} }

variable "secretsmanager_secret_versions" { default = {} }

variable "s3_bucket_public_access_blocks" { default = {} }

variable "s3_bucket_versionings" { default = {} }

variable "s3_bucket_server_side_encryption_configurations" { default = {} }

variable "route53_records" { default = {} }

variable "security_group_rules" { default = {} }

variable "iam_role_policies" { default = {} }

variable "iam_openid_connect_providers" { default = {} }

variable "eks_addons" { default = {} }

variable "eks_pod_identity_associations" { default = {} }

variable "eks_access_entries" { default = {} }

variable "eks_access_policy_associations" { default = {} }

variable "routes" { default = {} }

variable "vpc_peering_connections" { default = {} }

variable "vpc_peering_connection_options" { default = {} }

variable "ec2_client_vpn_endpoints" { default = {} }

variable "ec2_client_vpn_network_associations" { default = {} }

variable "ec2_client_vpn_routes" { default = {} }

variable "ec2_client_vpn_authorization_rules" { default = {} }

variable "sesv2_configuration_sets" { default = {} }

variable "sesv2_configuration_set_event_destinations" { default = {} }

variable "mq_brokers" { default = {} }
