output "user_arn" {
  description = "ARN del usuario IAM creado"
  value       = aws_iam_user.ian.arn
}

output "grupo_nombre" {
  description = "Nombre del grupo EC2 asignado"
  value       = aws_iam_group.ec2_users.name
}

output "policy_arn" {
  description = "ARN de la politica IAM custom de minimo privilegio"
  value       = aws_iam_policy.ec2_limited_access.arn
}
