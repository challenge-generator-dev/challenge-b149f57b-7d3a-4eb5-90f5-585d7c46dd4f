# providers.tf - Configuración del proveedor AWS y restricción de versión de Terraform
# Este archivo declara el proveedor AWS y establece la versión mínima de Terraform
# requerida para el proyecto. La versión de Terraform se especifica como rango
# para permitir actualizaciones menores sin romper la compatibilidad.

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
# Se define la región por defecto y se habilita el uso de tags para todos los recursos.
# Los tags son esenciales para la organización y seguimiento de los recursos en AWS.
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "notificaciones"
      ManagedBy   = "Terraform"
    }
  }
}

# Variables globales utilizadas en el proveedor
# Estas variables permiten parametrizar la configuración del proveedor AWS
# para diferentes entornos (dev, prod, etc.).
variable "environment" {
  description = "Entorno en el que se desplegará la infraestructura (dev, prod, etc.)"
  type        = string
  default     = "dev"
}