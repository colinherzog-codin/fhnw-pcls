resource "aws_ses_email_identity" "email_identity" {
  email = var.email_address
}

resource "aws_ses_receipt_rule_set" "rule_set" {
  rule_set_name = "default-rule-set"
}
