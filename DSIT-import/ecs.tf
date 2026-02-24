# ecs.tf
resource "aws_ecs_cluster" "dsit-llmlite-gateway-main-cluster-fg" {
  name = "dsit-llmlite-gateway-main-cluster-fg"

  # MATCH LIVE (plan shows live had disabled; do not cause a change now)
  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  # Some accounts show execute command configuration in state; include to avoid diff:
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
      # kms_key_id and log config are not needed if they aren't set in your account
    }
  }

  # Keep the tag to prevent removal
  tags = { Name = "dsit-llmlite-gateway-main-cluster-fg" }
}

resource "aws_ecs_service" "dsit-llmlite-gateway-main-cluster-fg" {
  name    = "litellm"
  cluster = aws_ecs_cluster.dsit-llmlite-gateway-main-cluster-fg.id

  # MATCH LIVE: use family:revision string (NOT ARN)
  task_definition = "dsit-litellm:11"

  # MATCH LIVE
  availability_zone_rebalancing = "ENABLED"

  # MATCH LIVE: capacity provider (do not set launch_type)
  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = 0
    weight            = 1
  }

  # MATCH LIVE load balancer mapping
  load_balancer {
    target_group_arn = aws_lb_target_group.dsit-litellm-tg-4000.arn
    container_name   = "LIteLLM" # case-sensitive
    container_port   = 4000
  }

  # MATCH LIVE networking
  network_configuration {
    subnets = [
      aws_subnet.dsit-llmlite-gateway-main-private-eu-west-2a.id,
      aws_subnet.dsit-llmlite-gateway-main-private-eu-west-2b.id,
    ]
    security_groups  = [aws_security_group.dsit-llmlite-gateway-main-fargate-sg.id]
    assign_public_ip = true
  }

  enable_execute_command  = true
  enable_ecs_managed_tags = true
  scheduling_strategy     = "REPLICA"

  deployment_controller {
    type = "ECS"
  }
  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  lifecycle {
    # Avoid noise from ECS internals or CI/CD updates
    ignore_changes = [
      task_definition,
      desired_count,
      platform_version,
      propagate_tags,
      triggers,
      capacity_provider_strategy,
    ]
  }
}