# VCard Creation with Terraform on AWS
## Project Overview
This school project demonstrates the use of Terraform on AWS to create a VCard. It highlights the interaction of at least five AWS services through Terraform, focusing on scalability and cost-effectiveness.

### Usage
To create a VCard, use the following cURL command:
```bash
curl -X PUT \
-H "Content-Type: application/json" \
-d '{"id": "a14sfoi", "firstName": "Alice", "lastName": "Johnson", "phone": "555-1234"}' \
"https://your-api.execute-api.us-east-1.amazonaws.com/prod/user"
```
Note: Replace https://your-api.execute-api.us-east-1.amazonaws.com/prod/user with your API endpoint.

## Setup and Configuration
### Prerequisites
- AWS Account with IAM credentials
- Terraform (version 1.6.0+)
- GitHub repository

### Environment Variables
- `TF_LOG`: Terraform logging level
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`: AWS credentials
- `AWS_DEFAULT_REGION`: AWS region
- `BUCKET_TF_STATE`: S3 bucket for Terraform state

### Terraform varaibles
See the ./terraform README.md for more information.

### GitHub Actions
Automated pipeline triggers on push/pull requests to `main` branch for `.tf` files.

## Usage
- Update Terraform configurations in your repository.
- Push changes or create pull requests.
- Monitor GitHub Actions for pipeline status.

### Workflow Steps
1. **Initialization**: `terraform init`
2. **Formatting**: `terraform fmt`
3. **Validation**: `terraform validate`
4. **Planning**: `terraform plan`
5. **Application**: `terraform apply`
