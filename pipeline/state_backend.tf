terraform {
  backend "s3" {
    bucket = "chatbot-using-gpt-slack-integration-pipeline-backend"
    encrypt = true
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}