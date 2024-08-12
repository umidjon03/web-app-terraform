resource "snowflake_grant_database_role" "db_to_account" {
  database_role_name = "\"${snowflake_database_role.object_viewer.database}\".\"${snowflake_database_role.object_viewer.name}\""
  parent_role_name   = snowflake_account_role.account_reader_role.name
}

resource "snowflake_grant_account_role" "role_to_user" {
  role_name   = snowflake_account_role.account_reader_role.name
  user_name   = snowflake_user.user.name
}

resource "snowflake_grant_privileges_to_database_role" "usage_db" {
  privileges         = ["USAGE"]
  database_role_name = "\"${snowflake_database_role.object_viewer.database}\".\"${snowflake_database_role.object_viewer.name}\""
  on_database        = snowflake_database_role.object_viewer.database
}

resource "snowflake_grant_privileges_to_database_role" "usage_schema" {
  privileges         = ["USAGE"]
  database_role_name = "\"${snowflake_database_role.object_viewer.database}\".\"${snowflake_database_role.object_viewer.name}\""
  on_schema {
    all_schemas_in_database = snowflake_database_role.object_viewer.database
  }
}

resource "snowflake_grant_privileges_to_database_role" "select_table" {
  privileges         = ["SELECT"]
  database_role_name = "\"${snowflake_database_role.object_viewer.database}\".\"${snowflake_database_role.object_viewer.name}\""
  on_schema_object {
    object_type = "TABLE"
    object_name = "\"${snowflake_database.tf_demo_database.name}\".\"${snowflake_schema.tf_demo_schema.name}\".\"${snowflake_table.demo_table.name}\""
  }
}

resource "snowflake_grant_privileges_to_database_role" "select_view" {
  privileges         = ["SELECT"]
  database_role_name = "\"${snowflake_database_role.object_viewer.database}\".\"${snowflake_database_role.object_viewer.name}\""
  on_schema_object {
    object_type = "VIEW"
    object_name = "\"${snowflake_database.tf_demo_database.name}\".\"${snowflake_schema.tf_demo_schema.name}\".\"${snowflake_view.demo_view.name}\""
  }
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_access" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.account_reader_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.task_warehouse.name
  }
}

# resource "snowflake_warehouse_grant" "warehouse_grant" {
  
#   warehouse_name = snowflake_warehouse.task_warehouse.name
#   privilege      = "USAGE"
#   roles          = ["TF_DEMO_READER"]
# }

# resource "snowflake_database_grant" "database_ro_grant" {
#   database_name = snowflake_database.tf_demo_database.name

#   privilege = "USAGE"
#   roles     = ["TF_DEMO_READER"]
# }

# resource "snowflake_schema_grant" "schema_ro_grant" {
#   database_name = snowflake_database.tf_demo_database.name
#   schema_name   = snowflake_schema.tf_demo_schema.name

#   privilege = "USAGE"
#   roles     = ["TF_DEMO_READER"]
# }

# resource "snowflake_table_grant" "table_ro_grant" {
#   database_name = snowflake_database.tf_demo_database.name
#   schema_name   = snowflake_schema.tf_demo_schema.name

#   privilege = "SELECT"
#   roles     = ["TF_DEMO_READER"]

#   on_future         = true
#   with_grant_option = false
#   on_all            = false
# }

# resource "snowflake_view_grant" "view_ro_grant" {
#   database_name = snowflake_database.tf_demo_database.name
#   schema_name   = snowflake_schema.tf_demo_schema.name

#   privilege = "SELECT"
#   roles     = ["TF_DEMO_READER"]

#   on_future         = true
#   with_grant_option = false
#   on_all            = false
# }