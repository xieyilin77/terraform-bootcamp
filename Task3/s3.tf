# S3-Buckets für verschiedene Zwecke
resource "aws_s3_bucket" "buckets" {
  for_each = toset(["data", "logs", "backup"])

  bucket = "terraform-lab-yilin-${each.key}"
  tags = {
    Name    = each.key
    Purpose = each.key
  }
}