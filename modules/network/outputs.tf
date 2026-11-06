# Outputs del módulo de red
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.notificaciones.id
}

output "vpc_cidr" {
  description = "CIDR de la VPC"
  value       = aws_vpc.notificaciones.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.publica[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.privada[*].id
}

output "security_group_id" {
  description = "ID del security group"
  value       = aws_security_group.notificaciones.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.notificaciones.id
}