variable "region" {
    description = "Default region for the provider"
    type = string
    default = "us-east-1"
}

variable "app_name" {
    description = "Name of the web app"
    type = string
    default = "web_app"
}

variable "environment_name" {
    description = "Environment name"
    type = string
    default = "dev"
}

variable "instance_type" {
    description = "enter instance type"
    type = string
    default = "t2.micro"
}

variable "ami" {
    description = "The AMI for ec2 instance OS"
    type = string
    default = "ami-011899242bb902164" # Ubuntu 20.04 
}

variable "bucket_prefix" {
    description = "S3 bucket name"
    type = string
}

variable "create_dns_zone" {
    description = "Should a dns zone be created"
    type = bool
    default = false
}

variable "domain" {
    description = "Domain name"
    type = string
}

variable "db_name" {
    description = "Database name"
    type = string
}

variable "db_user" {
    description = "username for database"
    type = string
}

variable "db_pass" {
    description = "Enter a password for the database"
    type = string
    sensitive = true
}