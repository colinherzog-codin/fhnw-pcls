variable "lambda_invoke_arn" {
  description = "ARN of the Lambda function to be invoked"
  type        = string
}

variable "lambda_invoke_name" {
  description = "Name of the Lambda function to be invoked"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "aws_account_id" {
  description = "The AWS Account ID"
  type        = string
}
