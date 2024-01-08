<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 dynamodb_table_name  = 
	 environment  = 
	 lambda_execution_role_name  =  }
```
## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.user_data_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of the DynamoDB table to create | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment (staging, prod) | `string` | n/a | yes |
| <a name="input_lambda_execution_role_name"></a> [lambda\_execution\_role\_name](#input\_lambda\_execution\_role\_name) | Name of the Lambda execution role | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_stream_arn"></a> [dynamodb\_stream\_arn](#output\_dynamodb\_stream\_arn) | n/a |
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | n/a |
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->