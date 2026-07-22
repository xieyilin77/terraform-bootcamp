locals {
  name_prefix = "terraform-lab-${var.student_name}-${terraform.workspace}"

  common_tags = {
    Owner       = var.student_name
    Environment = terraform.workspace
    ManagedBy   = "terraform"
  }
}