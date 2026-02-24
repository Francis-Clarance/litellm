resource "aws_subnet" "dsit-llmlite-gateway-main-private-eu-west-2a" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.2.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = "false"

  tags = { 
    Name = "dsit-llmlite-gateway-main-private-eu-west-2a"
  }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-private-eu-west-2b" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.3.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = "false"

  tags = {
    Name = "dsit-llmlite-gateway-main-private-eu-west-2b"
  }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-database-eu-west-2a" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.4.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = "false"
 
  tags = { 
    Name = "dsit-llmlite-gateway-main-database-eu-west-2a"
  }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-database-eu-west-2b" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.5.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = "false"

  tags = { 
    Name = "dsit-llmlite-gateway-main-database-eu-west-2b"
  }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-public-eu-west-2a" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.0.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = true
  
  tags = { 
    Name = "dsit-llmlite-gateway-main-public-eu-west-2a" 
  }
}

resource "aws_subnet" "dsit-llmlite-gateway-main-public-eu-west-2b" {
  vpc_id                                         = aws_vpc.dsit-litellm-gateway-main.id
  cidr_block                                     = "10.1.1.0/24"
  assign_ipv6_address_on_creation                = "false"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  map_public_ip_on_launch                        = true

  tags = { 
    Name = "dsit-llmlite-gateway-main-public-eu-west-2b" 
  }
}
