resource "aws_instance" "webserver" {
  ami           = "ami-009be0edec0817ffd"
  instance_type = "t3.micro"

  tags = {
    Name  = "Linux-webserver"
    Owner = "neuefische"
  }
}