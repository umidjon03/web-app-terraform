variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

variable "user_password" {
  description = "password for snowflake user"
  type        = string
  sensitive   = true
}

variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "snowflake_private_key" {
  type        = string
  description = "Private key used to access Snowflake"
  sensitive   = true
}