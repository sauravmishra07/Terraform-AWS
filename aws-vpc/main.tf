terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "6.9.0"
        }
    }
}

provider "aws" {
    region = "eu-north-1"
  
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "my_vpc"
    }
}

resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "private_subnet"
    }
  
}

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my_vpc.id
    map_public_ip_on_launch = true
    tags = {
      Name = "public_subnet"
    }
  
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "my-igw"
    }
}

resource "aws_route_table" "my-route-table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
  
}

resource "aws_route_table_association" "public-association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.my-route-table.id
}