resource "aws_vpc" "nginx-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "nignx-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.nginx-vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "pubic-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block            = "10.0.2.0/24"
  vpc_id                = aws_vpc.nginx-vpc.id
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "public_nginx_igw" {
  vpc_id = aws_vpc.nginx-vpc.id
  tags = {
    Name = "nginx-igw"
  }

}

resource "aws_route_table" "nginx-rt" {
  vpc_id = aws_vpc.nginx-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_nginx_igw.id
  }

}

resource "aws_route_table_association" "nginx-route-rt-public-igw" {
  route_table_id = aws_route_table.nginx-rt.id
  subnet_id      = aws_subnet.public_subnet.id

}
