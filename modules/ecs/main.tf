# ECS Cluster
resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
  tags = var.tags
}

# ECS Task Definition
resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.task_family
  requires_compatibilities = [var.launch_type]
  network_mode = "awsvpc"
  cpu = var.container_cpu
  memory = var.container_memory
  container_definitions    = jsonencode([
    {
      name       = var.container_name
      image      = var.container_image
      cpu        = var.container_cpu
      memory     = var.container_memory
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
  tags                     = var.tags
}

#Default VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# ECS Service
resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.cluster.arn
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type

  network_configuration {
    subnets = data.aws_subnets.default_vpc_subnets.ids
    security_groups = [var.security_group]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = var.tags
}
