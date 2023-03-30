resource "aws_codepipeline" "chatbot-using-gpt-slack-integration-pipeline" {

    name = "chatbot-using-gpt-slack-integration-pipeline"
    role_arn = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-iam-role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.codepipeline-artifacts.id
    }

    stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["chatbot-using-gpt-slack-integration-code"]
            configuration = {
                FullRepositoryId = "coolguy0704/chatbot-using-gpt-slack-integration"
                BranchName   = "master"
                ConnectionArn = var.codestar_connection_credentials
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }

    stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["chatbot-using-gpt-slack-integration-code"]
            configuration = {
                ProjectName = "chatbot-using-gpt-slack-integration-code-tfplan"
            }
        }
    }

    stage {
        name ="Deploy"
        action{
            name = "Deploy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["chatbot-using-gpt-slack-integration-code"]
            configuration = {
                ProjectName = "chatbot-using-gpt-slack-integration-code-tfapply"
            }
        }
    }

}