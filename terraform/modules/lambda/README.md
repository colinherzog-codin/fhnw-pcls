<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 aws_api_gateway_rest_api_arn  = 
	 dynamodb_stream_arn  = 
	 dynamodb_table_name  = 
	 email  = 
	 lambda_execution_role_arn  = 
	 region  = 
	 s3_bucket_name  =  }
```
## Resources

| Name | Type |
|------|------|
| [aws_lambda_event_source_mapping.dynamodb_trigger_mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.api_request_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function.dynamodb_trigger_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.lambda_payload](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_api_gateway_rest_api_arn"></a> [aws\_api\_gateway\_rest\_api\_arn](#input\_aws\_api\_gateway\_rest\_api\_arn) | ARN of the API Gateway REST API | `string` | n/a | yes |
| <a name="input_dynamodb_stream_arn"></a> [dynamodb\_stream\_arn](#input\_dynamodb\_stream\_arn) | The ARN of the dynamodb stream | `string` | n/a | yes |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | Name of the DynamoDB table | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email address to send vcards to | `string` | n/a | yes |
| <a name="input_lambda_execution_role_arn"></a> [lambda\_execution\_role\_arn](#input\_lambda\_execution\_role\_arn) | ARN of the Lambda execution role | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of the S3 bucket for storing VCF files | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_request_handler_arn"></a> [api\_request\_handler\_arn](#output\_api\_request\_handler\_arn) | n/a |
| <a name="output_api_request_handler_name"></a> [api\_request\_handler\_name](#output\_api\_request\_handler\_name) | n/a |
| <a name="output_dynamodb_trigger_handler_arn"></a> [dynamodb\_trigger\_handler\_arn](#output\_dynamodb\_trigger\_handler\_arn) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->