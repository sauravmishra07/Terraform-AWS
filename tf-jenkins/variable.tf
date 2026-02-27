variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04"
  default     = "ami-08c40ec9ead489470"  # Ubuntu 22.04 in us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key pair name"
  default     = "my-ec2-key"
}