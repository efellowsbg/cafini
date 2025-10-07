data "aws_iam_policy_document" "assume_role" {
  count = can(var.settings.assume_role_policy) ? 0 : 1

  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = try(var.settings.assume_principals, ["ec2.amazonaws.com"])
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "main" {
  assume_role_policy    = local.assume_role_policy
  description           = try(var.settings.description, null)
  force_detach_policies = try(var.settings.force_detach_policies, null)
  max_session_duration  = try(var.settings.max_session_duration, null)
  name                  = try(var.settings.name, null)
  name_prefix           = try(var.settings.name_prefix, null)
  path                  = try(var.settings.path, null)
  permissions_boundary  = try(local.permissions_boundary, null)
  tags                  = local.tags
}
