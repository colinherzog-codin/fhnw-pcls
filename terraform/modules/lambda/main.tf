resource "aws_lambda_function" "api_request_handler" {
  function_name = "apiRequestHandler"
  role          = var.lambda_execution_role_arn
  handler       = "api_handler.lambda_handler"
  runtime       = "python3.8"
  filename      = data.archive_file.lambda_payload.output_path

  environment {
    variables = {
      VCARD_DYNAMODB_TABLE = var.dynamodb_table_name
      REGION         = var.region
    }
  }
}

resource "aws_lambda_function" "dynamodb_trigger_handler" {
  function_name = "dynamodbTriggerHandler"
  role          = var.lambda_execution_role_arn
  handler       = "dynamodb_trigger.lambda_handler"
  runtime       = "python3.8"
  filename      = data.archive_file.lambda_payload.output_path

  environment {
    variables = {
      VCF_BUCKET_NAME = var.s3_bucket_name
      VCARD_DYNAMODB_TABLE = var.dynamodb_table_name
      EMAIL = var.email
    }
  }
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_request_handler.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.aws_api_gateway_rest_api_arn}/*/*"
}

data "archive_file" "lambda_payload" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_function_payload"
  output_path = "${path.module}/lambda_function_payload.zip"
}

resource "aws_lambda_event_source_mapping" "dynamodb_trigger_mapping" {
  event_source_arn = var.dynamodb_stream_arn
  function_name   = aws_lambda_function.dynamodb_trigger_handler.function_name
  starting_position = "TRIM_HORIZON"
}