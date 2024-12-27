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

