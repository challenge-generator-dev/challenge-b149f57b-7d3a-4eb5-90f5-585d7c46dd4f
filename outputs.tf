# ==============================================================================
# SALIDAS DE LA INFRAESTRUCTURA
# ==============================================================================
# Exposición de información relevante para otros módulos o ambientes

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "default_security_group_id" {
  description = "ID del security group por defecto"
  value       = module.network.default_security_group_id
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

output "lb_dns_name" {
  description = "Nombre DNS del Load Balancer"
  value       = module.compute.lb_dns_name
}

output "lb_arn" {
  description = "ARN del Load Balancer"
  value       = module.compute.lb_arn
}