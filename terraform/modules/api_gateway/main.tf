resource "aws_api_gateway_rest_api" "user_data_api" {
  name        = "UserDataAPI"
  description = "API for handling user data with token authentication"
}

resource "aws_api_gateway_resource" "user_resource" {
  rest_api_id = aws_api_gateway_rest_api.user_data_api.id
  parent_id   = aws_api_gateway_rest_api.user_data_api.root_resource_id
  path_part   = "user"
}

resource "aws_api_gateway_method" "user_put_method" {
  rest_api_id   = aws_api_gateway_rest_api.user_data_api.id
  resource_id   = aws_api_gateway_resource.user_resource.id
  http_method   = "PUT"
  authorization = "NONE"  // No authorization

  request_parameters = {
    "method.request.header.Authorization" = false  // No authorization header
  }
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.user_data_api.id
  resource_id = aws_api_gateway_resource.user_resource.id
  http_method = aws_api_gateway_method.user_put_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.user_data_api.id
  resource_id             = aws_api_gateway_resource.user_resource.id
  http_method             = aws_api_gateway_method.user_put_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_invoke_arn}/invocations"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]

  rest_api_id = aws_api_gateway_rest_api.user_data_api.id
  stage_name  = "prod"
}
