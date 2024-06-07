resource "aws_ecs_service" "app_service" {
  name            = var.default_name
  cluster         = var.aws_ecs_service_cluster_name
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
}