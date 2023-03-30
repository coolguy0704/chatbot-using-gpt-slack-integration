resource "aws_codebuild_project" "chatbot-using-gpt-slack-integration-pipeline-codebuild-tfplan" {
  name          = "chatbot-using-gpt-slack-integration-pipeline-codebuild-tfplan"
  description   = "Plan stage for terraform"
  service_role  = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:1.4.2"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    registry_credential{
        credential = var.dockerhub_credentials
        credential_provider = "SECRETS_MANAGER"
    }
 }
 source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/tfplan-buildspec.yml")
 }
}

resource "aws_codebuild_project" "chatbot-using-gpt-slack-integration-pipeline-codebuild-tfapply" {
  name          = "chatbot-using-gpt-slack-integration-pipeline-codebuild-tfapply"
  description   = "Apply stage for terraform"
  service_role  = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:1.4.2"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    registry_credential{
        credential = var.dockerhub_credentials
        credential_provider = "SECRETS_MANAGER"
    }
 }
 source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/tfapply-buildspec.yml")
 }
}