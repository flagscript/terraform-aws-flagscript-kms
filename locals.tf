data "aws_caller_identity" "current" {}
data "aws_organizations_organization" "flagscript_org" {}

locals {
  current_account_id = data.aws_caller_identity.current.account_id
  org_id             = data.aws_organizations_organization.flagscript_org.id
  common_tags = {
    "github:module:repository" = "flagscript/terraform-aws-flagscript-kms"
    "terraform:module"         = "terraform-aws-flagscript-kms"
  }
}
