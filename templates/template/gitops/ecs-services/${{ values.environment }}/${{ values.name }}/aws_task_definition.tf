# Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = var.default_name
  network_mode             = var.network_mode
  requires_compatibilities = [var.launch_type]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.arn
  task_role_arn            = var.arn
   
  container_definitions = jsonencode([
    {
      name        = var.default_name
      image       = var.image
      cpu         = var.cpu
      memory      = var.memory
      essential   = true
      environment = []
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.hostPort
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      dockerLabels = {
        "traefik.enable"                               = "true"
        "traefik.http.routers.${var.default_name}.entrypoints" = "web"
        "traefik.http.routers.${var.default_name}.rule"        = "Host(`${var.default_name}.hypeempreendimentos.com.br`)"
      }

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-create-group"  = "true",
          "awslogs-region"        = var.aws_provider_region
          "awslogs-group"         = "/ecs/${var.default_name}"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = var.default_name
  }
}