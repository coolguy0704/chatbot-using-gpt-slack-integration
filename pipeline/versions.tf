terraform {
  required_version = "1.4.2"
  required_providers {
    aws = {
      version = "4.60.0"
    }

  }

}


provider "aws" {
  region  = "us-east-1"
  default_tags {
    tags = {
      ProjectName = "chatbot-using-gpt-slack-integration-pipeline"
    }
  }
}