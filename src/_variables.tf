variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "oidc_assume_role_arn" {
  description = "IAM Role ARN that GitHub Actions will assume via OIDC"
  type        = string
}

# variable "tfstate_prefix" {
#   description = "Optional prefix/path in S3 bucket for state files"
#   type        = string
#   default     = ""
# }

variable "remote_state_account_id" {
  description = "AWS account ID where remote Terraform states are stored (if any)"
  type        = string
  default     = ""
}

variable "global_settings" {
  description = "Global configuration for all resources, e.g., tags and inheritance behavior"
  type = object({
    tags                    = map(string)
    inherit_account_tags    = bool
  })
  default = {
    tags                 = {}
    inherit_account_tags = false
  }
}

variable "landingzone" {
  description = "Landing zone metadata and tfstate dependencies for AWS accounts"
  type = object({
    backend_type = string
    key          = string
    tfstates = optional(map(object({
      tfstate         = string
      account_id      = string
    })))
  })
}
