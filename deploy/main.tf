provider "aws" {
  region  = "us-east-1"
}
# locals {
#   prefix = "${var.prefix}-${terraform.workspace}"
#   common_tags = {
#     Environment = terraform.workspace
#     Project     = var.project
#     Owner       = var.contact
#     ManagedBy   = "Albus"
#   }
# }

# data "aws_region" "current" {}