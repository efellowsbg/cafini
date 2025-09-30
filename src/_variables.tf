variable "region" {
  type = string
}

# variable "aws_account_id" {
#   type        = string
# }

# variable "remote_state_account_id" {
#   type        = string
# }

# variable "tfstate_bucket" {
#   type        = string
# }

variable "global_settings" {
  description = "Global configuration for all resources, e.g., tags and inheritance behavior"
  type = object({
    tags                 = map(string)
    inherit_account_tags = bool
  })
  default = {
    tags                 = {}
    inherit_account_tags = false
  }
}

# variable "landingzone" {
#   description = "Landing zone metadata and tfstate dependencies for AWS accounts"
#   type = object({
#     backend_type = string
#     key          = string
#     tfstates = optional(map(object({
#       tfstate         = string
#       account_id      = string
#     })))
#   })
# }
