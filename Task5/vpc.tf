resource "aws_vpc" "mumbai-vpc" {
  provider   = aws.ap-south-mumbai
  cidr_block = "10.1.0.0/16"
  tags       = { Name = "Mumbai-VPC" }
}

resource "aws_vpc" "virginia-vpc" {
  provider   = aws.us-east-virginia
  cidr_block = "10.2.0.0/16"
  tags       = { Name = "Virginia-VPC" }
}