variable "student_name" {
  description = "Your unique identifier, used in resource names"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "training"
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}