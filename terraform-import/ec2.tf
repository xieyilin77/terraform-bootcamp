terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # oder deine bevorzugte Region
}

resource "aws_instance" "example" {
  ami           = "ami-009be0edec0817ffd" # Amazon Linux 2 in eu-central-1
  instance_type = "t3.micro"

  tags = {
    Name  = "Linux2023"
    Owner = "yilin"
  }
}