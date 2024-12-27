# ECS Task Role
resource "aws_iam_role" "task_role" {
  name               = var.task_role_name
  assume_role_policy = data.aws_iam_policy_document.task_assume_role_policy.json
  tags               = var.tags
}

# Task Assume Role Policy Document
data "aws_iam_policy_document" "task_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# ECS Execution Role
resource "aws_iam_role" "execution_role" {
  name               = var.execution_role_name
  assume_role_policy = data.aws_iam_policy_document.execution_assume_role_policy.json
  tags               = var.tags
}

# Execution Assume Role Policy Document
data "aws_iam_policy_document" "execution_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# Task Role Policies
resource "aws_iam_role_policy_attachment" "task_role_policies" {
  for_each = toset(var.task_role_policies)
  role     = aws_iam_role.task_role.name
  policy_arn = each.value
}

# Execution Role Policies
resource "aws_iam_role_policy_attachment" "execution_role_policies" {
  for_each = toset(var.execution_role_policies)
  role     = aws_iam_role.execution_role.name
  policy_arn = each.value
}
