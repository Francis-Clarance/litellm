resource "aws_db_subnet_group" "dsit-litellm-rds-pg-subnetgrp" {
  name        = "dsit-litellm-rds-pg-subnetgrp"
  description = "The RDS Aurora Subnet Group that references the Database subnets in eu-west-2s and eu-wes-2b"

  subnet_ids = [
    aws_subnet.dsit-llmlite-gateway-main-database-eu-west-2a.id,
    aws_subnet.dsit-llmlite-gateway-main-database-eu-west-2b.id,
  ]

  tags = {}
}