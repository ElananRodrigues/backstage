terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "5.17.0" }
  }

  backend "s3" {
    bucket = "hype-ecs-terraform-state"
    key    = "cluster-ecs/${{ values.environment }}/${{ values.name }}/terraform.tfstate"
    region = "us-east-1"
  }
}