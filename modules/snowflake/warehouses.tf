resource "snowflake_warehouse" "task_warehouse" {
  name           = var.environment_name == "PROD" ? "TASK_WAREHOUSE" : "TASK_WAREHOUSE_${var.environment_name}"
  warehouse_size = var.environment_name == "PROD" ? "LARGE" : "SMALL"
  auto_resume    = true
  auto_suspend   = 1
}
