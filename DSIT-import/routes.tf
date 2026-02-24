resource "aws_route_table" "dsit-llmlite-gateway-main-route-table" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.dsit-llmlite-gateway-main-igw.id
  }
  tags = { 
    Name = "dsit-llmlite-gateway-main-route-table" 
  }
}

resource "aws_route_table" "dsit-llmlite-gateway-main-private-rt-2a" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dsit-llmlite-gateway-main-nat-eu-west-2a.id
  }
  tags = { 
    Name = "dsit-llmlite-gateway-main-private-rt-2a" 
  }
}

resource "aws_route_table" "dsit-llmlite-gateway-main-private-rt-2b" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dsit-llmlite-gateway-main-nat-eu-west-2b.id
  } 
  tags = { 
    Name = "dsit-llmlite-gateway-main-private-rt-2b" 
  }
}


