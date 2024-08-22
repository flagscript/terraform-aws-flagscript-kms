output "alias" {
  description = "Alias of the kms key."
  value       = aws_kms_alias.symmetric_key_alias.name
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the key."
  sensitive   = true
  value       = aws_kms_key.symmetric_key.arn
}

output "id" {
  description = "The globally unique identifier for the key"
  sensitive   = true
  value       = aws_kms_key.symmetric_key.key_id
}

output "key_account_id" {
  description = "Account id of the kms key."
  value       = local.current_account_id
}
