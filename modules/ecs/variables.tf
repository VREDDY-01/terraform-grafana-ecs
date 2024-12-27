variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "task_family" {
  description = "Family name for the task definition"
  type        = string
}

variable "container_definitions" {
  description = "List of container definitions for the task"
  type        = any
}

variable "task_cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory for the task in MiB"
  type        = string
  default     = "512"
}

variable "network_mode" {
  description = "The network mode for the task definition"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Launch types required by the task"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "execution_role_arn" {
  description = "ARN of the task execution IAM role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the IAM role that tasks can assume"
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

variable "deployment_controller_type" {
  description = "Type of deployment controller"
  type        = string
  default     = "ECS"
}

variable "network_configuration" {
  description = "Network configuration for the ECS service"
  type = object({
    subnets         = list(string)
    security_groups = list(string)
    assign_public_ip = bool
  })
  default = null
}

variable "target_group_arn" {
  description = "ARN of the target group for load balancing"
  type        = string
}

variable "container_name" {
  description = "Name of the container for load balancing"
  type        = string
}

variable "container_port" {
  description = "Port number of the container for load balancing"
  type        = number
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
