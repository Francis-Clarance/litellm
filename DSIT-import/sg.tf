resource "aws_security_group" "dsit-llmlite-gateway-main-alb-sg" {
  name        = "dsit-llmlite-gateway-main-alb-sg"
  description = "Security group for dsit-llmlite-gateway-main ALB"
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  lifecycle {
    ignore_changes = [description, ingress, egress, tags]
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-bedrock-sg" {
  name        = "dsit-llmlite-gateway-main-bedrock-vpce"
  description = "Allows HTTPS traffic from Fargate to connect to Amazon Bedrock."
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  #  ingress {
  #    description     = "HTTPS from ECS Fargate"
  #    from_port       = 443
  #    to_port         = 443
  #    protocol        = "tcp"
  #    security_groups = [aws_security_group.dsit-llmlite-gateway-main-fargate-sg.id]
  #  }

  #  egress {
  #    from_port   = 0
  #    to_port     = 0
  #    protocol    = "-1"
  #    cidr_blocks = ["0.0.0.0/0"]
  #  }

  #  tags = {
  #    Name = "dsit-llmlite-gateway-main-bedrock-sg"
  #  }

  lifecycle {
    ignore_changes = [description, ingress, egress, tags]
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-fargate-sg" {
  name        = "dsit-llmlite-gateway-main-fargate-sg"
  description = "Security group for dsit-llmlite-gateway-main Fargate "
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  lifecycle {
    ignore_changes = [description, ingress, egress, tags]
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-rds-sg" {
  name        = "dsit-llmlite-gateway-main-rds-sg"
  description = "Security group for dsit-llmlite-gateway-main RDS "
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  lifecycle {
    ignore_changes = [description, ingress, egress, tags]
  }
}
