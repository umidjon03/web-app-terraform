module "indeed-app-module" {
  source           = "../modules/aws"
  bucket_prefix    = "indeed-${local.environment_name}"
  domain           = "indeed-umidjon.com"
  app_name         = "indeed"
  environment_name = local.environment_name
  instance_type    = "t2.micro"
  create_dns_zone  = false
  db_name          = "${local.environment_name}IndeedDB"
  db_user          = "foo"
  db_pass          = var.db_pass
}

module "snowflake_resources" {
  source              = "../modules/snowflake"
  time_travel_in_days = 1
  database            = var.database
  environment_name    = local.environment_name
  user_password       = var.user_password
}
