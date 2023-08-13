terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
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
  profile                  = "keio-aic-databricks"
}

resource "aws_s3_bucket" "test" {
  bucket = "keio-aic-databricks-test-bucket"
}
