resource "aws_vpc" "dsit-litellm-gateway-main" {
  cidr_block                           = "10.1.0.0/20"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"

  tags = {
    Name = "dsit-litellm-gateway-main"
  }
}
