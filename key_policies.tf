data "aws_iam_policy_document" "base_key_policy_document" {
  statement {
    actions = ["kms:*"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.current_account_id}:root"]
    }
    resources = ["*"]
    sid       = "Enable iam policies for this account"
  }
}

data "aws_iam_policy_document" "org_key_use_policy_document" {
  statement {
    actions = [
      "kms:Describe*",
      "kms:List*",
      "kms:Get*",
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey*",
      # "kms:ReEncrypt*"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [local.org_id]
    }
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
    sid       = "Allow use of the key for the organization."
  }
}

data "aws_iam_policy_document" "ou_key_use_policy_document" {
  statement {
    actions = [
      "kms:Describe*",
      "kms:List*",
      "kms:Get*",
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey*",
      # "kms:ReEncrypt*"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [local.org_id]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "aws:PrincipalOrgPaths"
      values   = var.principal_org_paths
    }
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
    sid       = "Allow access for specific OUs and their descendants."
  }
}

data "aws_iam_policy_document" "kms_policy_document" {
  source_policy_documents = compact([
    data.aws_iam_policy_document.base_key_policy_document.json,
    var.allow_organization_access ? data.aws_iam_policy_document.org_key_use_policy_document.json : null,
    length(var.principal_org_paths) > 0 ? data.aws_iam_policy_document.ou_key_use_policy_document.json : null
  ])
}
