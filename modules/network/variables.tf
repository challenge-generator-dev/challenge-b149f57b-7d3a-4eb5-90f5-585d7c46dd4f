# modules/network/variables.tf - Variables específicas para el módulo de red
# Este archivo define las variables necesarias para configurar la red del servicio
# de notificaciones, incluyendo VPC, subredes y puertas de enlace.

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC del servicio de notificaciones"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad donde se desplegarán las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}