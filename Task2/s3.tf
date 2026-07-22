resource "aws_s3_bucket" "neuefische-s3bucket" {
  for_each = {
    dev  = "neuefische-app-yilin-log"
    test = "neuefische-app-yilin-log"
    prod = "neuefische-app-yilin-log"
    pre  = "neuefische-app-yilin-log"
  }

  bucket = "${each.key}-${each.value}"

  tags = {
    Name = "${each.key}-${each.value}"
    Env  = each.key
  }
}