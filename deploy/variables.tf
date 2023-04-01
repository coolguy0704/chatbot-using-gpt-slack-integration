variable "prefix" {
  default = "chatgpt"
}

variable "project" {
  default = "recipe-app-api-devops"
}

variable "contact" {
  default = "maintainer@mgonzalezo.com"
}

variable "bastion_key_name" {
  default = "recipe-app-api-devops-bastion"
}
variable "ecr_image_api" {
  description = "ECR Image for API"
  default     = "registry.hub.docker.com/library/helloworld"
}

variable "ecr_image_proxy" {
  description = "ECR Image for API"
  default     = "registry.hub.docker.com/library/busybox"
}