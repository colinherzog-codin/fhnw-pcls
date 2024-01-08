output "dynamodb_table_name" {
  value = aws_dynamodb_table.user_data_table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.user_data_table.arn
}

output "dynamodb_stream_arn" {
  value       = aws_dynamodb_table.user_data_table.stream_arn
}
