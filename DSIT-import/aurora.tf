resource "aws_rds_cluster" "dsit-litellm-rds-pg-prod" {
  cluster_identifier = "dsit-litellm-rds-pg-prod"
  engine             = "aurora-postgresql"

  db_subnet_group_name   = aws_db_subnet_group.dsit-litellm-rds-pg-subnetgrp.name
  vpc_security_group_ids = [aws_security_group.dsit-llmlite-gateway-main-rds-sg.id]

  preferred_backup_window      = "23:43-00:13"
  preferred_maintenance_window = "wed:03:11-wed:03:41"
  copy_tags_to_snapshot        = true
  enable_http_endpoint         = true
  skip_final_snapshot          = true
  deletion_protection          = true
  performance_insights_enabled = true

  enabled_cloudwatch_logs_exports = [
    "iam-db-auth-error",
    "instance",
    "postgresql"
  ]

  lifecycle {
    ignore_changes = [serverlessv2_scaling_configuration]
  }

}

resource "aws_rds_cluster_instance" "dsit-litellm-rds-pg-prod-instance-1" {
  identifier         = "dsit-litellm-rds-pg-prod-instance-1"
  cluster_identifier = aws_rds_cluster.dsit-litellm-rds-pg-prod.id
  engine             = "aurora-postgresql"

  instance_class = "db.serverless"

  monitoring_interval = 60
  promotion_tier      = 1

  lifecycle {
    ignore_changes = [force_destroy, instance_class]
  }
}

resource "aws_rds_cluster_instance" "dsit-litellm-rds-pg-prod-instance-1-eu-west-2b" {
  identifier         = "dsit-litellm-rds-pg-prod-instance-1-eu-west-2b"
  cluster_identifier = aws_rds_cluster.dsit-litellm-rds-pg-prod.id
  engine             = "aurora-postgresql"

  instance_class      = "db.serverless"
  monitoring_interval = 60
  promotion_tier      = 1

  lifecycle {
    ignore_changes = [force_destroy, instance_class]
  }
}