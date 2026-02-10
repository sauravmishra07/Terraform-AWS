terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
    # configuraation options for ec2
    region = "eu-west-1"
}

resource "aws_instance" "terra-ec2" {
    ami = "ami-03446a3af42c5e74e"
    instance_type = "t3.micro"

    tags = {
       Name = "firstServer"
    }
  
}