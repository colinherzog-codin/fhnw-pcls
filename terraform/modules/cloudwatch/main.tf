resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_log_group" "api_gateway_log_group" {
  name = "/aws/api_gateway/${var.api_gateway_name}"
  retention_in_days = var.log_retention_days
}