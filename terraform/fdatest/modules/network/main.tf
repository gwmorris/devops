
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_a
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "Subnet ${var.region}a"
  }
}


resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_b
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"

  tags = {
    Name = "Subnet ${var.region}b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_c
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"

  tags = {
    Name = "Subnet ${var.region}c"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_subnet_a_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_vpc.vpc.main_route_table_id
}

output "vpc" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_a" {
  value = "${aws_subnet.public_subnet_a.id}"
}

output "public_subnet_b" {
  value = "${aws_subnet.public_subnet_b.id}"
}

output "public_subnet_c" {
  value = "${aws_subnet.public_subnet_c.id}"
}
