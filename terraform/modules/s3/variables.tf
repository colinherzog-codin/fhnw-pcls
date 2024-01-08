variable "s3_bucket_name" {
  description = "The name of the S3 bucket to create"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "lambda_exec_role_arn" {
  description = "ARN of the Lambda execution role"
  type        = string
}