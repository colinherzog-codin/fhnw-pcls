resource "aws_s3_bucket" "vcf_files_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "VCFFilesBucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.vcf_files_bucket.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_policy" "lambda_s3_access" {
  bucket = aws_s3_bucket.vcf_files_bucket.id
  policy = data.aws_iam_policy_document.s3_access_policy.json
}

data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    actions   = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
    resources = [
      aws_s3_bucket.vcf_files_bucket.arn,
      "${aws_s3_bucket.vcf_files_bucket.arn}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = [var.lambda_exec_role_arn]
    }
  }
}
