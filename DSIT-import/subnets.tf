resource "aws_subnet" "dsit-llmlite-gateway-main-private-eu-west-2a" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.2.0/24"
  # availability_zone       = "euw2-az2 (eu-west-2a)"
  map_public_ip_on_launch = false
  tags                    = { Name = "dsit-llmlite-gateway-main-private-eu-west-2a" }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-private-eu-west-2b" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.3.0/24"
  # availability_zone       = "euw2-az3 (eu-west-2b)"
  map_public_ip_on_launch = false
  tags                    = { Name = "dsit-llmlite-gateway-main-private-eu-west-2b" }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-database-eu-west-2a" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.4.0/24"
  # availability_zone       = "euw2-az2 (eu-west-2a)"
  map_public_ip_on_launch = false
  tags                    = { Name = "dsit-llmlite-gateway-main-database-eu-west-2a" }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-database-eu-west-2b" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.5.0/24"
  # availability_zone = "euw2-az3 (eu-west-2b)"
  tags = { Name = "dsit-llmlite-gateway-main-database-eu-west-2b" }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-public-eu-west-2a" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.0.0/24"
  # availability_zone       = "euw2-az2 (eu-west-2a)"
  map_public_ip_on_launch = true
  tags                    = { Name = "dsit-llmlite-gateway-main-public-eu-west-2a" }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-public-eu-west-2b" {
  vpc_id     = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block = "10.1.1.0/24"
  # availability_zone       = "euw2-az3 (eu-west-2b)"
  map_public_ip_on_launch = true
  tags                    = { Name = "dsit-llmlite-gateway-main-public-eu-west-2b" }
}