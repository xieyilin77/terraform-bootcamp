resource "aws_instance" "WebServer" {
  ami           = data.aws_ami.amzn_linux_2023_latest.id
  instance_type = var.ec2_instance_type

  tags = {
    Name = "Web Server"
  }
}