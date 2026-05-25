variable "aws_region" {
  description = "AWS region used by the provider."
  type        = string
  default     = "us-east-1"
}

variable "iam_user_name" {
  description = "IAM user name created for the demo."
  type        = string
  default     = "Ian"
}

variable "iam_group_name" {
  description = "IAM group name used to attach the limited EC2 policy."
  type        = string
  default     = "EC2Users"
}

variable "project_tag_value" {
  description = "Only EC2 instances with this Project tag value can be started, stopped or rebooted."
  type        = string
  default     = "cloud-devops-portfolio"
}

variable "tags" {
  description = "Common tags applied to created resources."
  type        = map(string)
  default = {
    Owner       = "Larry Rondan"
    Project     = "cloud-devops-portfolio"
    Environment = "demo"
    ManagedBy   = "Terraform"
  }
}
