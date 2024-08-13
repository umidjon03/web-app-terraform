terraform {
  backend "s3" {
    bucket         = "terraform-backend-umidjon"
    key            = "indeed/staging/terraform.tfstate3"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.94.1"
    }
  }
}