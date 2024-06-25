terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-da960bb5"
    key = "example/terraform.tfstate"
    dynamodb_table = "terraform-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}