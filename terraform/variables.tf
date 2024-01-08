variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "prod"
}
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}