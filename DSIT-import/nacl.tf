resource "aws_network_acl" "dsit-llmlite-gateway-main-public-nacl" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id

  tags = {
    Name = "dsit-llmlite-gateway-main-public-nacl"
  }
}

# resource "aws_network_acl_association" "dsit-llmlite-gateway-main-public-nacl" {
#  network_acl_id = aws_network_acl.dsit-llmlite-gateway-main-public-nacl.id
#  subnet_id      = aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2a.id
# }