resource "aws_iam_role" "lambda_execution_role" {
  name = "lambdaExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:DeleteItem",
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
      "ses:SendEmail"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name        = "LambdaExecutionPolicy"
  description = "A policy that allows lambda functions to log to CloudWatch and access DynamoDB and S3"
  policy      = data.aws_iam_policy_document.lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
}

resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name        = "LambdaDynamoDBPolicy"
  description = "IAM policy for Lambda function to access DynamoDB stream"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["lambda:InvokeFunction"],
        Resource = "*",
      },
      {
        Effect = "Allow",
        Action = [
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:DescribeStream",
          "dynamodb:ListStreams",
        ],
        Resource = var.dynamodb_stream_arn,
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_policy_attach" {
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
  role       = aws_iam_role.lambda_execution_role.name
}
