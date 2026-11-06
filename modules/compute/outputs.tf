output "instance_arns" {
  description = "ARNs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notifications_server[*].arn
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notifications_server[*].id
}

output "instance_private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notifications_server[*].private_ip
}

output "instance_public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notifications_server[*].public_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.instance_sg.id
}

output "iam_instance_profile_arn" {
  description = "ARN del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notifications_profile.arn
}