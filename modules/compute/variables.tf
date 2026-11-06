# modules/compute/variables.tf - Variables específicas para el módulo de cómputo
# Este archivo define las variables necesarias para configurar el cómputo del servicio
# de notificaciones, incluyendo instancias EC2, Auto Scaling Groups y balanceadores.

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
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

variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs de grupos de seguridad para las instancias"
  type        = list(string)
}