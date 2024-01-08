output "api_gateway_id" {
  value = aws_api_gateway_rest_api.user_data_api.id
}

output "api_gateway_execution_arn" {
  value = aws_api_gateway_rest_api.user_data_api.execution_arn
}
output "user_data_api_name" {
  value = aws_api_gateway_rest_api.user_data_api.name
}

output "api_gateway_endpoint" {
  value       = "https://${aws_api_gateway_rest_api.user_data_api.id}.execute-api.${var.region}.amazonaws.com"
}