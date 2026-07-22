resource "aws_instance" "example" {
  ami           = "ami-009be0edec0817ffd"
  instance_type = "t3.micro"
  count         = 3 # creates 2 identical EC2 instances

  tags = {
    Name  = "Instance-${count.index + 1}"
    Owner = "neuefische"
  }
}