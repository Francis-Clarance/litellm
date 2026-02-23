# Create provider + versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_internet_gateway" "dsit-llmlite-gateway-main-igw" {
  vpc_id = aws_vpc.dsit-litellm-gateway-main.id
  tags = {
    Name = "dsit-llmlite-gateway-main-igw"
  }
}

