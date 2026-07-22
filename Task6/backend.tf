terraform {
  backend "s3" {
    bucket         = "yilin2-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "tf-dev-state-lock"
  }
}
