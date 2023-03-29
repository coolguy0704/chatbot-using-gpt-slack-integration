terraform {
  backend "s3" {
    bucket = "chatbot-using-gpt-slack-integration-pipeline-bucket"
    encrypt = true
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}