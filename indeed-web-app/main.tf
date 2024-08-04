terraform {
  backend "s3" {
    bucket         = "terraform-backend-umidjon"
    key            = "06-organization-and-modules/indeed-web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

module "indeed-app-module" {
  source = "../my_module"

  # Input Variables
  bucket_prefix    = "indeed"
  domain           = "indeed-umidjon.com"
  app_name         = "indeed"
  environment_name = "staging"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "indeedDB"
  db_user          = "foo"
  db_pass          = var.db_pass
}
