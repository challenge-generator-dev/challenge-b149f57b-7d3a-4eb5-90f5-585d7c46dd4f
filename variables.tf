# variables.tf - Declaración de variables globales para parametrizar la infraestructura
# Este archivo define las variables que se utilizarán en los módulos de red y cómputo.
# Las variables permiten que la infraestructura sea reutilizable y configurable por ambiente.

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

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Número deseado de instancias en el Auto Scaling Group"
  type        = number
}