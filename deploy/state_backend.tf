terraform {
  backend "s3" {
    bucket         = "chatbot-using-gpt-slack-integration-infrastructure-bucket" #Add an S3 bucket to store terraform artifacts
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

