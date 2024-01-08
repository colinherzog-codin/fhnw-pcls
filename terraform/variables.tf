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
variable "email" {
  description = "Email address to send vcards to"
  type        = string
  default     = "colin.herzog@codin.ch"
}