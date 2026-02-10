terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
    region = "eu-west-1"
}

resource "random_id" "rand-id" {
    byte_length = 8
  
}

resource "aws_s3_bucket" "ecommerce-bucket" {
    bucket = "ecommerce-bucket${random_id.rand-id.hex}"
  
}

resource "aws_s3_bucket_public_access_block" "ecommerce-bucket" {
    bucket = aws_s3_bucket.ecommerce-bucket.id
    
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "ecommerce-app" {
    bucket = aws_s3_bucket.ecommerce-bucket.id
  policy = jsonencode({
     Version = "2012-10-17"
     Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.ecommerce-bucket.arn}/*"
      }
     ]
  })
  
}

resource "aws_s3_bucket_website_configuration" "ecommerce-app" {
    bucket = aws_s3_bucket.ecommerce-bucket.id
  
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.ecommerce-bucket.id
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"

}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.ecommerce-bucket.id
  source = "./style.css"
  key = "style.css"
  content_type = "text/css"

}

resource "aws_s3_object" "script_js" {
  bucket = aws_s3_bucket.ecommerce-bucket.id
  source = "./script.js"
  key = "script.js"
  content_type = "application/javascript"

}

output "website-url" {
  value = aws_s3_bucket_website_configuration.ecommerce-app.website_endpoint

}