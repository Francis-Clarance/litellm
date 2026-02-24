resource "aws_security_group" "dsit-llmlite-gateway-main-alb-sg" {
  name        = "dsit-llmlite-gateway-main-alb-sg"
  description = "Security group for dsit-llmlite-gateway-main ALB"
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  # Allow HTTP from anywhere
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS from anywhere
  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dsit-llmlite-gateway-main-alb-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-bedrock-sg" {
  name        = "dsit-llmlite-gateway-main-bedrock-vpce"
  description = "Allows HTTPS traffic from Fargate to connect to Amazon Bedrock."
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  # Allow HTTPS from anywhere
  ingress {
    description     = "HTTPS from Internet"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.dsit-llmlite-gateway-main-fargate-sg.id]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dsit-llmlite-gateway-main-bedrock-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-fargate-sg" {
  name        = "dsit-llmlite-gateway-main-fargate-sg"
  description = "Security group for dsit-llmlite-gateway-main Fargate "
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  # Allow all inbound traffic
  ingress {
    description     = "All inbound traffic"
    from_port       = 4000
    to_port         = 4000
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.dsit-llmlite-gateway-main-alb-sg.id]
  }

  # Allow HTTPS from anywhere
  egress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow PostgreSQL from anywhere
  egress {
    description = "PostgreSQL from Internet"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dsit-llmlite-gateway-main-fargate-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "dsit-llmlite-gateway-main-rds-sg" {
  name        = "dsit-llmlite-gateway-main-rds-sg"
  description = "Security group for dsit-llmlite-gateway-main RDS "
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id

  # Allow PostgreSQL from anywhere
  ingress {
    description     = "PostgreSQL from Internet"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.dsit-llmlite-gateway-main-fargate-sg.id]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dsit-llmlite-gateway-main-rds-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

