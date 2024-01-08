output "api_request_handler_arn" {
  value = aws_lambda_function.api_request_handler.arn
}

output "dynamodb_trigger_handler_arn" {
  value = aws_lambda_function.dynamodb_trigger_handler.arn
}

output "api_request_handler_name" {
  value = aws_lambda_function.api_request_handler.function_name
}