terraform {
  backend "s3" {
    bucket         = "terraform-state-yilin"
    key            = "lab/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-yilin"
    encrypt        = true
  }
}