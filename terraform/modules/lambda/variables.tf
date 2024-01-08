variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing VCF files"
  type        = string
}

variable "aws_api_gateway_rest_api_arn" {
  description = "ARN of the API Gateway REST API"
  type        = string
}

variable "lambda_execution_role_arn" {
  description = "ARN of the Lambda execution role"
  type        = string
}

variable "dynamodb_stream_arn" {
  type = string
  description = "The ARN of the dynamodb stream"
}

variable "email" {
    description = "Email address to send vcards to"
    type        = string
}