variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "development"
}