resource "aws_route_table_association" "dsit-llmlite-gateway-main-route-table" {
  subnet_id      = aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2b.id
  route_table_id = aws_route_table.dsit-llmlite-gateway-main-route-table.id
}

resource "aws_route_table_association" "dsit-llmlite-gateway-main-private-rt-2a" {
  subnet_id      = aws_subnet.dsit-llmlite-gateway-main-private-eu-west-2a.id
  route_table_id = aws_route_table.dsit-llmlite-gateway-main-private-rt-2a.id
}

resource "aws_route_table_association" "dsit-llmlite-gateway-main-private-rt-2b" {
  subnet_id      = aws_subnet.dsit-llmlite-gateway-main-private-eu-west-2b.id
  route_table_id = aws_route_table.dsit-llmlite-gateway-main-private-rt-2b.id
}
