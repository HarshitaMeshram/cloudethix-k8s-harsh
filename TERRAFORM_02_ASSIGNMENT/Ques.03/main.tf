terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# aws_vpc

resource "aws_vpc" "this_main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MAIN_VPC"
  }
}

#subnets
#public subnets

resource "aws_subnet" "this_pub_01" {
  vpc_id     = aws_vpc.this_main_vpc.id
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "PUB_01"
  }
}

resource "aws_subnet" "this_pub_02" {
  vpc_id     = aws_vpc.this_main_vpc.id
  cidr_block = "10.0.64.0/18"

  tags = {
    Name = "PUB_02"
  }
}

# private subnets
resource "aws_subnet" "this_pri_01" {
  vpc_id     = aws_vpc.this_main_vpc.id
  cidr_block = "10.0.128.0/18"

  tags = {
    Name = "PRI_01"
  }
}

resource "aws_subnet" "this_pri_02" {
  vpc_id     = aws_vpc.this_main_vpc.id
  cidr_block = "10.0.192.0/18"

  tags = {
    Name = "this_pri_02"
  }
}

# internet gateway

resource "aws_internet_gateway" "this_gw" {
  vpc_id = aws_vpc.this_main_vpc.id

  tags = {
    Name = "GTWAY"
  }
}

# Create Public Route Table

resource "aws_route_table" "Pub_Route_Tb1" {
  vpc_id = aws_vpc.this_main_vpc.id

  route = []

  tags = {
    Name = "PUB_RT_01"
  }
}

resource "aws_route_table" "Pub_Route_Tb2" {
  vpc_id = aws_vpc.this_main_vpc.id

  route = []

  tags = {
    Name = "PUB_RT_02"
  }
}

# Create Private Route Table

resource "aws_route_table" "Pri_Route_Tbl" {
  vpc_id = aws_vpc.this_main_vpc.id

  route = []

  tags = {
    Name = "PRI_RT_01"
  }
}

resource "aws_route_table" "Pri_Route_Tb2" {
  vpc_id = aws_vpc.this_main_vpc.id

  route = []

  tags = {
    Name = "PRI_RT_02"
  }
}

# Add IGW in Public Route table (0.0.0.0/0) 

resource "aws_route" "r" {
  route_table_id         = aws_route_table.Pub_Route_Tb1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this_gw.id

}

# Add Public Subnet (1a & 1b) in Route table

resource "aws_route_table_association" "this_pub1rta" {
  subnet_id      = aws_subnet.this_pub_01.id
  route_table_id = aws_route_table.Pub_Route_Tb1.id

}

resource "aws_route_table_association" "this_pub2rta" {
  subnet_id      = aws_subnet.this_pub_02.id
  route_table_id = aws_route_table.Pub_Route_Tb2.id
}

resource "aws_route_table_association" "this_pri1rta" {
  subnet_id      = aws_subnet.this_pri_01.id
  route_table_id = aws_route_table.Pri_Route_Tbl.id
}

resource "aws_route_table_association" "this_pri2rta" {
  subnet_id      = aws_subnet.this_pri_02.id
  route_table_id = aws_route_table.Pri_Route_Tbl.id
}

# elastic ip 

resource "aws_eip" "this_lb" {
  domain = "vpc"
}

# Create a NAT Gateway in Public Subnet 

resource "aws_nat_gateway" "this_gateway" {
  allocation_id = aws_eip.this_lb.id
  subnet_id     = aws_subnet.this_pub_01.id

  tags = {
    Name = "NAT_GTWY"
  }

}



