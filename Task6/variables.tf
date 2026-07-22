variable "aws_region" {
  description = "AWS Region In Which Resources will be Created"
  type        = string
  default     = "us-west-2"
}

variable "owner" {
  description = "Name of the student creating resources"
  type        = string
  default     = "yilin"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}