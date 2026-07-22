resource "aws_vpc" "neuefischevpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "neuefische-vpc"
  }
}

module "networking" {
  source = "./modules/vpc"

  environment = "production"
  cidr_block  = "10.0.0.0/16"
}

output "networking_vpc_id" {
  value = module.networking.vpc_id
}