terraform {
  backend "s3" {
    bucket = "chatbot-using-gpt-slack-integration-pipeline-backend-1"
    encrypt = true
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}