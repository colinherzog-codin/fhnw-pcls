<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 email_address  =  }
```
## Resources

| Name | Type |
|------|------|
| [aws_ses_email_identity.email_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_email_identity) | resource |
| [aws_ses_receipt_rule_set.rule_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule_set) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | Email address used for SES vcard notificaiton | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ses_identity_arn"></a> [ses\_identity\_arn](#output\_ses\_identity\_arn) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->