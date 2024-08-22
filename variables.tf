# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "key_name" {
  description = "Friendly name for the key. Also used for the alias."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "allow_organization_access" {
  default     = false
  description = "Allow key use to the organizaiton."
  type        = false
}

variable "deletion_window_in_days" {
  default     = 7
  description = "The waiting period, specified in number of days. Defaults to 7."
  type        = number

  validation {
    condition     = var.deletion_window_in_days > 6 && var.deletion_window_in_days < 31
    error_message = "Var deletion_window_in_days must be between 7 and 30, inclusive."
  }
}

variable "enable_key_rotation" {
  default     = false
  description = "Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
}

variable "is_multiregion" {
  default     = false
  description = "Indicates whether the KMS key is a multi-Region key. Defaults to false."
  type        = bool
}

variable "key_description" {
  default     = "Flagscript kms key."
  description = "Description of the kms key."
  type        = string
}

variable "principal_org_paths" {
  default     = []
  description = "Ou paths to allow key use to."
  type        = list(string)
}
