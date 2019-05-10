variable "service" {}

variable "role_name" {
  description = "The name of the created IAM role"
  default     = ""
}

variable "policy_name" {
  description = "The name of the created IAM policy"
  default     = ""
}

variable "secret_name" {
  description = "The name of the Secrets Manager secret to allow access to"
  default     = ""
}
