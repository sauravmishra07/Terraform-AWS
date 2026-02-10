terraform {
   required_providers {
     aws ={
        source = "hashicorp/aws"
        version = "6.31.0"
     }
   }
}

provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "problem-server" {
    ami = "ami-"
    instance_type = "t3.micro"

    tags = {
        Name = "FistServer"
    }
  
}