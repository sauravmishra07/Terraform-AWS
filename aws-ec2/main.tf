terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "eu-north-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-042b4708b1d05f512"
    instance_type = "t3.micro"

    tags = {
        Name = "SampleServer"
    }
  
}