# 1. S3-Bucket
resource "aws_s3_bucket" "main" {
  bucket = "terraform-lab-yilin-main"
  tags = {
    Name = "main-bucket"
  }
}

# 2. Versioning (hängt explizit vom Bucket ab)
resource "aws_s3_bucket_versioning" "main_versioning" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }

  # EXPLICIT DEPENDENCY: Wartet auf den Bucket
  depends_on = [aws_s3_bucket.main]
}

# 3. Lifecycle (hängt explizit vom Versioning ab)
resource "aws_s3_bucket_lifecycle_configuration" "main_lifecycle" {
  bucket = aws_s3_bucket.main.id

  # EXPLICIT DEPENDENCY: Wartet auf Versioning
  depends_on = [aws_s3_bucket_versioning.main_versioning]

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}