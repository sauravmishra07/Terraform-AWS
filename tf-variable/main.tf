terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

locals {
  owner = "chota-don"
  name  = "fine-shyt"
}

resource "aws_instance" "fine-server" {
  ami           = "ami-03446a3af42c5e74e"
  instance_type = var.aws_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_config.v-size
    volume_type           = var.ec2_config.v-type
  }
  tags = merge(
    var.additional-tag, {
      Name = local.name
    }
  )

}
