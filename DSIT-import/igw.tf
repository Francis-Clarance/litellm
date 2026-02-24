resource "aws_internet_gateway" "dsit-llmlite-gateway-main-igw" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id

  tags = {
    Name = "dsit-llmlite-gateway-main-igw"
  }
}
