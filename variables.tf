variable "service" {
  description = "Service name to associate with the Shibboleth SP"
}

variable "role_name" {
  description = "IAM role name"
  default     = null
}

variable "policy_name" {
  description = "IAM policy name"
  default     = null
}

variable "secret_name" {
  description = "Secrets Manager secret to which to grant access"
  default     = null
}

variable "tags" {
  description = "Tags to be applied to resources where supported"
  type        = map(string)
  default     = {}
}
