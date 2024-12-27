variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "security_group" {
  description = "Name of the ECS service"
  type        = string
}

variable "task_family" {
  description = "Family name for the task definition"
  type        = string
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

variable "desired_count" {
  description = "Number of tasks desired"
  type        = number
}

variable "launch_type" {
  description = "Launch type for the service"
  type        = string
  default     = "FARGATE"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "target_group_arn" {
  description = "Arn of the target group"
  type        = string
}
