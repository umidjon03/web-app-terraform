resource "snowflake_user" "user" {
  name         = var.environment_name
  login_name   = var.environment_name
  password     = var.user_password
  disabled     = false
  display_name = "${var.environment_name} Snowflake User"

  default_warehouse       = snowflake_warehouse.task_warehouse.name
  default_role            = snowflake_account_role.account_reader_role.name
  must_change_password = false
}
