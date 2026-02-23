resource "aws_vpc" "dsit-litellm-gateway-main" {
  tags = {
    Name = "dsit-litellm-gateway-main"
  }
}