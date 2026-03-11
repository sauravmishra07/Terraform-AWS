resource "aws_s3_bucket" "remote-infra" {
    bucket = "saurav-infra-bucket"

    tags = {
      Name = "saurav-infra-bucket"
    }
  
}