<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.60 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.60 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.symmetric_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.symmetric_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.symmetric_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.base_key_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kms_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.org_key_use_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ou_key_use_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.flagscript_org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_organization_access"></a> [allow\_organization\_access](#input\_allow\_organization\_access) | Allow key use to the organizaiton. | `false` | `false` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. Defaults to 7. | `number` | `7` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_is_multiregion"></a> [is\_multiregion](#input\_is\_multiregion) | Indicates whether the KMS key is a multi-Region key. Defaults to false. | `bool` | `false` | no |
| <a name="input_key_description"></a> [key\_description](#input\_key\_description) | Description of the kms key. | `string` | `"Flagscript kms key."` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Friendly name for the key. Also used for the alias. | `string` | n/a | yes |
| <a name="input_principal_org_paths"></a> [principal\_org\_paths](#input\_principal\_org\_paths) | Ou paths to allow key use to. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | Alias of the kms key. |
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_id"></a> [id](#output\_id) | The globally unique identifier for the key |
| <a name="output_key_account_id"></a> [key\_account\_id](#output\_key\_account\_id) | Account id of the kms key. |
<!-- END_TF_DOCS -->