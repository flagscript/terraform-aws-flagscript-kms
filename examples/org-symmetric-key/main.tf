module "org_kms_key" {
  source                    = "flagscript/flagscript-kms/aws"
  version                   = "1.0.0"
  allow_organization_access = true
  key_description           = "Key usable by my aws organizaiton.s"
  key_name                  = "best-key-ever"
}
