terraform {
  backend "s3" {
    bucket         = "terraform-backend-umidjon"
    key            = "indeed/global/terraform.tfstate"
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

# Route53 zone is shared across staging and production
resource "aws_route53_zone" "primary" {
  name = "indeed-umidjon.com"
}
