resource "aws_s3_bucket" "codepipeline-artifacts" {
  bucket = "chatbot-using-gpt-slack-integration-pipeline-artifacts"
}

resource "aws_s3_bucket_acl" "codepipeline-artifacts-acl" {
  bucket = aws_s3_bucket.codepipeline-artifacts.id
  acl    = "private"
}