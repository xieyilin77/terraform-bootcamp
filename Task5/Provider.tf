terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# First provider — North Virginia
provider "aws" {
  region = "us-east-1"
  alias  = "us-east-virginia"
  default_tags {
    tags = {
      Terraform = "yes"
      Region    = "N.Virginia"
    }
  }
}

# Second provider — Mumbai
provider "aws" {
  region = "ap-south-1"
  alias  = "ap-south-mumbai"
  default_tags {
    tags = {
      Terraform = "yes"
      Region    = "Mumbai"
    }
  }
}