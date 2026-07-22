output "bucket_name" {
  value = module.lab_bucket.bucket_id
}

output "bucket_arn" {
  value = module.lab_bucket.bucket_arn
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "current_region" {
  value = data.aws_region.current.name
}

output "available_azs" {
  value = data.aws_availability_zones.available.names
}

output "website_url" {
  value = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}