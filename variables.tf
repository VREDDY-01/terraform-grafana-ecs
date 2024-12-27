variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  type = map(string)
}

variable "sg_name" {
  type = string
  description = "name of the security group"
}

variable "sg_description" {
  type = string
  description = "Description about the security group"
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Description of ingress rules"
}

variable "task_family" {
  type = string
  description = "Task defination family name"
}

variable "cluster_name" {
  type = string
  description = "Name of the Cluster"
}

variable "container_name" {
  description = "Name for the Container"
  type        = string
}
variable "container_image" {
  description = "Image URL"
  type        = string
}
variable "container_cpu" {
  description = "CPU value for container"
  type        = number
}
variable "container_memory" {
  description = "Memory value for container"
  type        = number
}
variable "container_port" {
  description = "Port value for container"
  type        = number
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks desired"
  type        = number
  default     = 1
}

variable "launch_type" {
  description = "Launch type for the service"
  type        = string
  default     = "FARGATE"
}
