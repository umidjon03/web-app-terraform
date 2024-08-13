resource "snowflake_database" "tf_demo_database" {
  name                        = var.environment_name == "PROD" ? var.database : "${var.database}_${var.environment_name}"
  data_retention_time_in_days = var.time_travel_in_days
}

resource "snowflake_schema" "tf_demo_schema" {
  name     = "DEMO_SCHEMA"
  database = snowflake_database.tf_demo_database.name
}
