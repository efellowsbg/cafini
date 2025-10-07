output "name" {
  value = aws_lambda_function.main.function_name
}

output "arn" {
  value = aws_lambda_function.main.arn
}

output "invoke_arn" {
  value = aws_lambda_function.main.invoke_arn
}

output "qualified_arn" {
  value = aws_lambda_function.main.qualified_arn
}
