terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}

provider "aws" {
    region =  "eu-west-1"
}

# creating a vpc
resource "aws_vpc" "first-terra-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "fist_vpc"
    }
}

#Private subnet 
resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.first-terra-vpc.id
    tags = {
      Name = "Private-subnet"
    }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.first-terra-vpc.id
    tags = {
      Name = "public-subnet"
    }
}

# internet gateway
resource "aws_internet_gateway" "public_igw" {
    vpc_id = aws_vpc.first-terra-vpc.id

    tags = {
      Name = "public-igw"
    }
}

# Routes table
resource "aws_route_table" "fist_route_table" {
    vpc_id = aws_vpc.first-terra-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.public_igw.id
    }  
}


resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.fist_route_table.id
  
}

resource "aws_instance" "myserver" { 
    ami = "ami-080ecf65f4d838a6e"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public_subnet.id
  
    tags = {
      Name = "Sampleserver"
    }
}