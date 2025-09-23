data "aws_caller_identity" "current" {}

locals {
  global_settings = merge(var.global_settings, {
    account_id = data.aws_caller_identity.current.account_id
    user_arn   = data.aws_caller_identity.current.arn
    user_id    = data.aws_caller_identity.current.user_id
  })
}