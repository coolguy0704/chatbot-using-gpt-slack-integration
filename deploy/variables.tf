variable "prefix" {
  default = "chatgpt"
}

variable "project" {
  default = "chatgpt-slack-integration"
}

variable "contact" {
  default = "maintainer@mgonzalezo.com"
}

variable "bastion_key_name" {
  default = "chatgpt-slack-devops-bastion"
}
variable "ecr_image_api" {
  description = "ECR Image for API"
  default     = "registry.hub.docker.com/library/helloworld"
}

variable "ecr_image_proxy" {
  description = "ECR Image for API"
  default     = "registry.hub.docker.com/library/busybox"
}