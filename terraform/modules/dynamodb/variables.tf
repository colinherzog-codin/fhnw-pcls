variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to create"
  type        = string
}

variable "environment" {
  description = "Deployment environment (staging, prod)"
  type        = string
}

variable "lambda_execution_role_name" {
  description = "Name of the Lambda execution role"
  type        = string
}
