output "cloudwatch_log_groups" {
  value = module.cloudwatch_log_groups
}

output "iam_groups" {
  value = module.iam_groups
}

output "iam_users" {
  value = module.iam_users
}

output "vpcs" {
  value = module.vpcs
}

# output "subnets" {
#   value = {
#     for vpc_key, vpc in module.vpcs :
#     vpc_key => vpc.subnets
#   }
# }

output "secretsmanager_secrets" {
  value = module.secretsmanager_secrets
}

output "vpc_endpoints" {
  value = module.vpc_endpoints
}

output "eips" {
  value = module.eips
}

output "iam_instance_profiles" {
  value = module.iam_instance_profiles
}

output "iam_roles" {
  value = module.iam_roles
}

output "iam_policies" {
  value = module.iam_policies
}

output "route_table_associations" {
  value = module.route_table_associations
}

output "route_tables" {
  value = module.route_tables
}

output "nat_gateways" {
  value = module.nat_gateways
}

output "internet_gateways" {
  value = module.internet_gateways
}

output "security_groups" {
  value = module.security_groups

}

output "kms_keys" {
  value = module.kms_keys
}

output "db_subnet_groups" {
  value = module.db_subnet_groups
}

output "launch_templates" {
  value = module.launch_templates
}

output "ec2_instances" {
  value = module.ec2_instances
}

output "aws_autoscaling_groups" {
  value = module.autoscaling_groups
}

output "lambda_functions" {
  value = module.lambda_functions
}

output "s3_buckets" {
  value = module.s3_buckets
}

output "s3_bucket_lifecycle_configurations" {
  value = module.s3_bucket_lifecycle_configurations
}

output "cloudtrails" {
  value = module.cloudtrails
}

output "s3_bucket_policies" {
  value = module.s3_bucket_policies
}

output "organizations_accounts" {
  value = module.organizations_accounts
}

output "organizations_policies" {
  value = module.organizations_policies
}

output "ecs_services" {
  value = module.ecs_services
}

output "ecs_clusters" {
  value = module.ecs_clusters
}

output "eks_clusters" {
  value = module.eks_clusters
}

output "eks_node_groups" {
  value = module.eks_node_groups
}

output "efs_file_system" {
  value = module.efs_file_system
}

output "dynamodb_tables" {
  value = module.dynamodb_tables
}

output "budgets_budgets" {
  value = module.budgets_budgets
}

output "config_config_rules" {
  value = module.config_config_rules
}

output "sns_topics" {
  value = module.sns_topics
}

output "cloudwatch_metric_alarms" {
  value = module.cloudwatch_metric_alarms
}

output "config_configuration_recorders" {
  value = module.config_configuration_recorders
}

output "rds_cluster_instances" {
  value = module.rds_cluster_instances
}

output "rds_clusters" {
  value = module.rds_clusters
}

output "db_instances" {
  value = module.db_instances
}

output "iam_user_policy_attachments" {
  value = module.iam_user_policy_attachments
}

output "iam_group_policy_attachments" {
  value = module.iam_group_policy_attachments
}

output "iam_role_policy_attachments" {
  value = module.iam_role_policy_attachments
}

output "directory_service_directories" {
  value = module.directory_service_directories
}

output "db_parameter_groups" {
  value = module.db_parameter_groups
}

output "db_option_groups" {
  value = module.db_parameter_groups
}

output "ssm_parameters" {
  value = module.ssm_parameters
}

output "sqs_queues" {
  value = module.sqs_queues
}

output "sqs_queue_policies" {
  value = module.sqs_queue_policies
}

output "sns_topic_policies" {
  value = module.sns_topic_policies
}

output "sns_topic_subscriptions" {
  value = module.sns_topic_subscriptions
}

output "secretsmanager_secret_versions" {
  value = module.secretsmanager_secret_versions
}

output "s3_bucket_public_access_blocks" {
  value = module.s3_bucket_public_access_blocks
}

output "s3_bucket_versionings" {
  value = module.s3_bucket_versionings
}

output "s3_bucket_server_side_encryption_configurations" {
  value = module.s3_bucket_server_side_encryption_configurations
}

output "route53_records" {
  value = module.route53_records
}

output "security_group_rules" {
  value = module.security_group_rules
}

output "iam_role_policies" {
  value = module.iam_role_policies
}

output "iam_openid_connect_providers" {
  value = module.iam_openid_connect_providers
}

output "eks_addons" {
  value = module.eks_addons
}

output "eks_pod_identity_associations" {
  value = module.eks_pod_identity_associations
}

output "eks_access_entries" {
  value = module.eks_access_entries
}

output "eks_access_policy_associations" {
  value = module.eks_access_policy_associations
}

output "routes" {
  value = module.routes
}

output "vpc_peering_connections" {
  value = module.vpc_peering_connections
}

output "vpc_peering_connection_options" {
  value = module.vpc_peering_connection_options
}

output "ec2_client_vpn_endpoints" {
  value = module.ec2_client_vpn_endpoints
}

output "ec2_client_vpn_network_associations" {
  value = module.ec2_client_vpn_network_associations
}

output "ec2_client_vpn_routes" {
  value = module.ec2_client_vpn_routes
}

output "ec2_client_vpn_authorization_rules" {
  value = module.ec2_client_vpn_authorization_rules
}

output "sesv2_configuration_sets" {
  value = module.sesv2_configuration_sets
}

output "sesv2_configuration_set_event_destinations" {
  value = module.sesv2_configuration_set_event_destinations
}

output "mq_brokers" {
  value = module.mq_brokers
}
