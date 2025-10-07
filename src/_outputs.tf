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
