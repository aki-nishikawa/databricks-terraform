terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }

    databricks = {
      source = "databricks/databricks"
    }
  }
  backend "s3" {
    bucket = "keio-aic-databricks-terraform-poc-tfstate-bucket"
    key    = "tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.aws_connection_profile
  region                   = var.aws_region
}

provider "databricks" {
  profile = var.databricks_connection_profile
}

