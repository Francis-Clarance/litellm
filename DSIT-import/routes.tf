resource "aws_route_table" "dsit-llmlite-gateway-main-route-table" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id
  tags   = { Name = "dsit-llmlite-gateway-main-route-table" }
}

resource "aws_route_table" "dsit-llmlite-gateway-main-private-rt-2a" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id
  tags   = { Name = "dsit-llmlite-gateway-main-private-rt-2a" }
}

resource "aws_route_table" "dsit-llmlite-gateway-main-private-rt-2b" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id
  tags   = { Name = "dsit-llmlite-gateway-main-private-rt-2b" }
}


