terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}

module "lab_bucket" {
  source = "./modules/s3-bucket"

  bucket_name = local.name_prefix
  tags = merge(local.common_tags, {
    CreatedInAccount = data.aws_caller_identity.current.account_id
  })
}

module "logs_bucket" {
  source = "./modules/s3-bucket"

  bucket_name = "${local.name_prefix}-logs"
  tags        = merge(local.common_tags, { Purpose = "logs" })
}

resource "aws_s3_bucket" "imported" {
  bucket = "terraform-lab-yilin-imported"
}

module "website_bucket" {
  source = "./modules/s3-bucket"

  bucket_name = "${local.name_prefix}-website"
  tags        = merge(local.common_tags, { Purpose = "static-website" })
}