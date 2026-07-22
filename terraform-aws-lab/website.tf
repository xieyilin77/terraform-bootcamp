resource "aws_s3_bucket_website_configuration" "website" {
  bucket = module.website_bucket.bucket_id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = module.website_bucket.bucket_id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "website" {
  bucket = module.website_bucket.bucket_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${module.website_bucket.bucket_arn}/*"
    }]
  })

  depends_on = [aws_s3_bucket_public_access_block.website]
}

resource "aws_s3_object" "index" {
  bucket       = module.website_bucket.bucket_id
  key          = "index.html"
  source       = "index.html"
  etag         = filemd5("index.html")
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = module.website_bucket.bucket_id
  key          = "error.html"
  source       = "error.html"
  etag         = filemd5("error.html")
  content_type = "text/html"
}