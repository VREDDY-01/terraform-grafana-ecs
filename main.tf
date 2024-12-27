provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source = "./modules/security_group"
  name = var.sg_name
  description = var.sg_description
  ingress_rules = var.ingress_rules
  tags = var.tags
}

module "ecs" {
  source = "./modules/ecs"
  task_family = var.task_family
  security_group = module.security_group.security_group_id
  cluster_name = var.cluster_name
  container_name = var.container_name
  container_image = var.container_image
  container_cpu = var.container_cpu
  container_memory = var.container_memory
  container_port = var.container_port
  service_name = var.service_name
  desired_count = var.desired_count
  launch_type = var.launch_type
  target_group_arn = module.load_balancer.target_group_arn
  tags = var.tags
}

module "load_balancer" {
  source = "./modules/load_balancer"
  security_group_id = module.security_group.security_group_id
  tags = var.tags
}
