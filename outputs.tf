output "user_arn" {
  description = "ARN del usuario Ian creado"
  value       = aws_iam_user.ian.arn
}

output "grupo_nombre" {
  description = "Nombre del grupo EC2 asignado"
  value       = aws_iam_group.ec2_users.name
}
