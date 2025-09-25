output "cloudwatch_log_groups" {
  value = module.cloudwatch_log_groups
}

output "iam_groups" {
  value = module.iam_groups
}

output "iam_users" {
  value = module.iam_users
}

# # output "subnets" {
# #   value = {
# #     for vnet_key, vnet in module.virtual_networks :
# #     vnet_key => vnet.subnets
# #   }
# # }
