terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0"
    }
      random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "eu-north-1"
}
resource "random_id" "random_bucket_id" {
  byte_length = 8
  
}

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "demo-bucket-${random_id.random_bucket_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.demo-bucket.bucket
    source = "./myfile.txt"
    key = "mydata.txt"
}

output "name" {
    value = random_id.random_bucket_id.hex
  
}