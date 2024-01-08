output "api_gateway_endpoint" {
  value = module.api_gateway.api_gateway_execution_arn
}

output "lambda_api_request_handler_arn" {
  value = module.lambda.api_request_handler_arn
}

output "dynamodb_table_arn" {
  value = module.dynamodb.dynamodb_table_arn
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "ses_identity_arn" {
  value = module.ses.ses_identity_arn
}

output "endpoint" {
  value = module.api_gateway.api_gateway_endpoint
}