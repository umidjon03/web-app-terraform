provider "aws" {
  region = "us-east-1"
}

provider "snowflake" {
  account  = "yeb20317.us-east-1"
  user     = "terraform_admin"
  password = "12345Qwert!"
  role     = "ACCOUNTADMIN"
}
