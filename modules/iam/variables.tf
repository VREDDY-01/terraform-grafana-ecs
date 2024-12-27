variable "task_role_name" {
  description = "Name of the ECS task role"
  type        = string
}

variable "execution_role_name" {
  description = "Name of the ECS execution role"
  type        = string
}

variable "task_role_policies" {
  description = "List of ARNs for policies to attach to the ECS task role"
  type        = list(string)
}

variable "execution_role_policies" {
  description = "List of ARNs for policies to attach to the ECS execution role"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the IAM roles"
  type        = map(string)
  default     = {}
}
