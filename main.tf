# ==============================================================================
# MÓDULO PRINCIPAL DE INFRAESTRUCTURA - SERVICIO DE NOTIFICACIONES
# ==============================================================================
# Este archivo orquesta la creación de los recursos de infraestructura
# utilizando los módulos de red y cómputo.

# Módulo de red: VPC, subnets, tablas de enrutamiento, security groups
module "network" {
  source = "./modules/network"

  environment = var.environment
  project     = var.project_name
  vpc_cidr    = var.vpc_cidr

  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

# Módulo de cómputo: EC2, Auto Scaling, Load Balancer
module "compute" {
  source = "./modules/compute"

  environment           = var.environment
  project               = var.project_name
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.private_subnet_ids
  security_group_ids    = [module.network.default_security_group_id]
  instance_type         = var.instance_type
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
  ami_id                = var.ami_id
}