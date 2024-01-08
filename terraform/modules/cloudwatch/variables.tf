variable "lambda_function_name" {
  description = "The name of the Lambda function for logging"
  type        = string
}

variable "api_gateway_name" {
  description = "The name of the API Gateway for logging"
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain log events"
  default     = 14
  type        = number
}
