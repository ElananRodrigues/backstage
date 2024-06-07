variable "aws_provider_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_ecs_service_cluster_name" {
  type    = string
  default = "${{ values.cluster }}-${{ values.environment }}"
}

variable "default_name" {
  default = "${{ values.name }}"
}

variable "image" {
  type    = string
  default = "nginx:latest"
}

variable "cpu" {
  default = 128
}

variable "memory" {
  default = 512
}

variable "container_port" {
  type    = number
  default = 80
}

variable "hostPort" {
  type    = number
  default = 0

}

variable "desired_count" {
  type    = number
  default = 1
}

variable "launch_type" {
  type    = string
  default = "EC2"
}

variable "network_mode" {
  type    = string
  default = "bridge"

}

variable "aws_subnet_ids" {
  type    = list(string)
  default = ["subnet-827fb1af", "subnet-0663da4f"]
}

variable "aws_vpc_id" {
  type    = string
  default = "vpc-a2d9e3c5"
}

variable "security_groups" {
  type    = list(string)
  default = ["sg-03735bd2181fcde36"]
}

variable "deployment_maximum_percent" {
  type    = number
  default = 200
}

variable "deployment_minimum_healthy_percent" {
  type    = number
  default = 0
}

variable "health_check_grace_period_seconds" {
  type    = number
  default = 10
}

variable "arn" {
  type    = string
  default = "arn:aws:iam::121083326736:role/ecsTaskExecutionRole"
}