variable "database" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "time_travel_in_days" {
  type        = number
  description = "Number of days for time travel feature"
}

variable "user_password" {
  description = "password for snowflake user"
  type        = string
  sensitive   = true
}
