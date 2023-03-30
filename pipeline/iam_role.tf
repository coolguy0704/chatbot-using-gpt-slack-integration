resource "aws_iam_role" "chatbot-using-gpt-slack-integration-pipeline-iam-role" {
  name = "chatbot-using-gpt-slack-integration-pipeline-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "chatbot-using-gpt-slack-integration-pipeline-policies" {
    statement{
        sid = ""
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement{
        sid = ""
        actions = ["cloudwatch:*", "s3:*", "codebuild:*", "codedeploy:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "chatbot-using-gpt-slack-integration-pipeline-policy" {
    name = "chatbot-using-gpt-slack-integration-pipeline-policy"
    path = "/"
    description = "Pipeline policy for chatbot-using-gpt-slack-integration-pipeline"
    policy = data.aws_iam_policy_document.chatbot-using-gpt-slack-integration-pipeline-policies.json
}

resource "aws_iam_role_policy_attachment" "chatbot-using-gpt-slack-integration-pipeline-attachment" {
    policy_arn = aws_iam_policy.chatbot-using-gpt-slack-integration-pipeline-policy.arn
    role = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-iam-role.id
}


resource "aws_iam_role" "chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role" {
  name = "chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "chatbot-using-gpt-slack-integration-pipeline-codebuild-policies" {
    statement{
        sid = ""
        actions = ["logs:*", "s3:*", "codebuild:*", "codedeploy:*", "secretsmanager:*","iam:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "chatbot-using-gpt-slack-integration-pipeline-codebuild-policy" {
    name = "chatbot-using-gpt-slack-integration-pipeline-codebuild-policy"
    path = "/"
    description = "Codebuild policy for chatbot-using-gpt-slack-integration-pipeline"
    policy = data.aws_iam_policy_document.chatbot-using-gpt-slack-integration-pipeline-codebuild-policies.json
}

resource "aws_iam_role_policy_attachment" "chatbot-using-gpt-slack-integration-pipeline-codebuild-attachment1" {
    policy_arn  = aws_iam_policy.chatbot-using-gpt-slack-integration-pipeline-codebuild-policy.arn
    role        = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role.id
}

/*
resource "aws_iam_role_policy_attachment" "chatbot-using-gpt-slack-integration-pipeline-codebuild-attachment2" {
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.chatbot-using-gpt-slack-integration-pipeline-codebuild-iam-role.id
}
*/

