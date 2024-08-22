resource "aws_kms_key" "symmetric_key" {
  bypass_policy_lockout_safety_check = false
  customer_master_key_spec           = "SYMMETRIC_DEFAULT"
  deletion_window_in_days            = var.deletion_window_in_days
  description                        = var.key_description
  enable_key_rotation                = var.enable_key_rotation
  is_enabled                         = true
  key_usage                          = "ENCRYPT_DECRYPT"
  multi_region                       = var.is_multiregion
  tags = merge(
    local.common_tags,
    {
      "name" = var.key_name
    }
  )
}

resource "aws_kms_key_policy" "symmetric_key_policy" {
  key_id = aws_kms_key.symmetric_key.id
  policy = data.aws_iam_policy_document.kms_policy_document.json
}

resource "aws_kms_alias" "symmetric_key_alias" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.symmetric_key.id
}
