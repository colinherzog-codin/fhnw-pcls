resource "aws_api_gateway_rest_api" "user_data_api" {
  # Creating REST API
  name        = "UserDataAPI"
  description = "API for handling user data with token authentication"
}

resource "aws_api_gateway_resource" "user_resource" {
  rest_api_id = aws_api_gateway_rest_api.user_data_api.id
  parent_id   = aws_api_gateway_rest_api.user_data_api.root_resource_id
  path_part   = "user"
}

resource "aws_api_gateway_method" "user_put_method" {
  # Configuring the HTTP method (PUT) for the user resource, with no authorization required
  rest_api_id   = aws_api_gateway_rest_api.user_data_api.id
  resource_id   = aws_api_gateway_resource.user_resource.id
  http_method   = "PUT"
  authorization = "NONE"
  request_parameters = {
    "method.request.header.Authorization" = false
  }
}

resource "aws_api_gateway_integration" "lambda_integration" {
  # Integrating the API with a Lambda function for processing requests
  rest_api_id             = aws_api_gateway_rest_api.user_data_api.id
  resource_id             = aws_api_gateway_resource.user_resource.id
  http_method             = aws_api_gateway_method.user_put_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_invoke_arn}/invocations"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  # Deploying the API to make it available for use, specifying the stage name
  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.user_data_api.id
  # Should use environment variables for stage name
  stage_name  = "prod"
}
