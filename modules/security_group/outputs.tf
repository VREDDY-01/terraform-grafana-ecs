output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.sg.id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.sg.arn
}