resource "snowflake_view" "demo_view" {
  database   = snowflake_database.tf_demo_database.name
  schema     = snowflake_schema.tf_demo_schema.name
  name       = "DEMO_VIEW"
  comment    = "Just represents the ${snowflake_table.demo_table.name} data"
  statement  = <<-SQL
    select * from "${snowflake_database.tf_demo_database.name}"."${snowflake_schema.tf_demo_schema.name}"."${snowflake_table.demo_table.name}";
SQL
  or_replace = false
  is_secure  = false
}
