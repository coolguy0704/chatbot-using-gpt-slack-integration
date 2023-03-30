terraform {
  required_version = "1.4.2"
  required_providers {
    aws = {
      version = "4.60.0"
    }

  }

}


provider "aws" {
  #profile = "default"
  region  = "us-east-1"
}