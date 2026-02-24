##############################################
# EIPs for NATs
##############################################
resource "aws_eip" "dsit-llmlite-gateway-main-nat-eu-west-2a" {
  domain = "vpc"
}

resource "aws_eip" "dsit-llmlite-gateway-main-nat-eu-west-2b" {
  domain = "vpc"
}

##############################################
# NAT Gateways (in PUBLIC subnets)
##############################################
resource "aws_nat_gateway" "dsit-llmlite-gateway-main-nat-eu-west-2a" {
  allocation_id = aws_eip.dsit-llmlite-gateway-main-nat-eu-west-2a.id
  subnet_id     = aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2a.id

  lifecycle {
    ignore_changes = [
      allocation_id,
      subnet_id,
      secondary_allocation_ids,
      tags,
    ]
  }
}

resource "aws_nat_gateway" "dsit-llmlite-gateway-main-nat-eu-west-2b" {
  allocation_id = aws_eip.dsit-llmlite-gateway-main-nat-eu-west-2b.id
  subnet_id     = aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2b.id

  lifecycle {
    ignore_changes = [
      allocation_id,
      subnet_id,
      secondary_allocation_ids,
      tags,
    ]
  }
}
