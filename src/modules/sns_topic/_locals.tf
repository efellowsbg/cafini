locals {
  policy = try(
    var.resources.iam_policies[var.settings.policy_ref].json,
    try(jsonencode(var.settings.policy), null)
  )

  application_success_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.application_success_feedback_role_ref].arn,
    try(var.settings.application_success_feedback_role_arn, null)
  )

  application_failure_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.application_failure_feedback_role_ref].arn,
    try(var.settings.application_failure_feedback_role_arn, null)
  )

  http_success_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.http_success_feedback_role_ref].arn,
    try(var.settings.http_success_feedback_role_arn, null)
  )

  http_failure_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.http_failure_feedback_role_ref].arn,
    try(var.settings.http_failure_feedback_role_arn, null)
  )

  lambda_success_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.lambda_success_feedback_role_ref].arn,
    try(var.settings.lambda_success_feedback_role_arn, null)
  )

  lambda_failure_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.lambda_failure_feedback_role_ref].arn,
    try(var.settings.lambda_failure_feedback_role_arn, null)
  )

  sqs_success_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.sqs_success_feedback_role_ref].arn,
    try(var.settings.sqs_success_feedback_role_arn, null)
  )

  sqs_failure_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.sqs_failure_feedback_role_ref].arn,
    try(var.settings.sqs_failure_feedback_role_arn, null)
  )

  firehose_success_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.firehose_success_feedback_role_ref].arn,
    try(var.settings.firehose_success_feedback_role_arn, null)
  )

  firehose_failure_feedback_role_arn = try(
    var.resources.iam_roles[var.settings.firehose_failure_feedback_role_ref].arn,
    try(var.settings.firehose_failure_feedback_role_arn, null)
  )

  kms_master_key_id = try(
    var.resources.kms_keys[var.settings.kms_master_key_ref].arn,
    try(var.settings.kms_master_key_id, null)
  )

  tags = merge(
    var.global_settings.tags,
    try(var.settings.tags, {})
  )
}
