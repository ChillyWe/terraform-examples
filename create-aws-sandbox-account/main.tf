terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_organizations_account" "group_account" {
  name      = "sample-group-sandbox-account" 
  email     = "chillywe@proton.me" 
  role_name = "Admin"
}