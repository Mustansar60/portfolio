provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "portfolio" {
  bucket = "mustansar.haseebxbiz.dev"
  force_destroy = true 
}

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.portfolio.id
  index_document { suffix = "index.html" }
}

resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.portfolio.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.portfolio.id
  depends_on = [aws_s3_bucket_public_access_block.public_block]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "arn:aws:s3:::mustansar.haseebxbiz.dev/*"
    }]
  })
}
