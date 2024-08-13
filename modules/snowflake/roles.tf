resource "snowflake_account_role" "account_reader_role" {
  name    = "READER_ADMIN_${var.environment_name}"
  comment = "This role is for only read purposes on its dedicated ${var.environment_name} objects"
}

resource "snowflake_database_role" "object_viewer" {
  database = snowflake_database.tf_demo_database.name
  name     = "${snowflake_database.tf_demo_database.name}_READER"
  comment  = "This role provides only read privilages on ${snowflake_database.tf_demo_database.name} database"
}
