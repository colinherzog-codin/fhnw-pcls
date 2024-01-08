terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "pcls-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}

provider "aws" {
  region = var.region
}


module "api_gateway" {
  source             = "./modules/api_gateway"
  lambda_invoke_arn  = module.lambda.api_request_handler_arn
  region             = var.region
  aws_account_id     = data.aws_caller_identity.current.account_id
  lambda_invoke_name = module.lambda.api_request_handler_name
}

module "lambda" {
  source                       = "./modules/lambda"
  dynamodb_table_name          = module.dynamodb.dynamodb_table_name
  s3_bucket_name               = module.s3.s3_bucket_name
  aws_api_gateway_rest_api_arn = module.api_gateway.api_gateway_execution_arn
  region                       = var.region
  lambda_execution_role_arn    = module.iam.lambda_execution_role_arn
  dynamodb_stream_arn          = module.dynamodb.dynamodb_stream_arn
  email                        = var.email
}


module "dynamodb" {
  source                     = "./modules/dynamodb"
  environment                = var.environment
  dynamodb_table_name        = "contactData"
  lambda_execution_role_name = module.iam.lambda_execution_role_name
}

module "s3" {
  source               = "./modules/s3"
  s3_bucket_name       = "pcls-contact-bucket"
  environment          = var.environment
  lambda_exec_role_arn = module.iam.lambda_execution_role_arn
}

module "ses" {
  source        = "./modules/ses"
  email_address = var.email
}

module "cloudwatch" {
  source               = "./modules/cloudwatch"
  lambda_function_name = module.lambda.api_request_handler_name
  api_gateway_name     = module.api_gateway.user_data_api_name
}

module "iam" {
  source              = "./modules/iam"
  user_data_table_arn = module.dynamodb.dynamodb_table_arn
  dynamodb_stream_arn = module.dynamodb.dynamodb_stream_arn
}

data "aws_caller_identity" "current" {}
