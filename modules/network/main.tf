# Módulo de red para el servicio de notificaciones
# Superficie de práctica: el estudiante definirá los recursos de red

resource "aws_vpc" "notificaciones" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "vpc_notificaciones_${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_internet_gateway" "notificaciones" {
  vpc_id = aws_vpc.notificaciones.id
  tags = {
    Name        = "igw_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "publica" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.notificaciones.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name        = "subnet_publica_notificaciones_${var.environment}_${count.index + 1}"
    Environment = var.environment
    Type        = "publica"
  }
}

resource "aws_subnet" "privada" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.notificaciones.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name        = "subnet_privada_notificaciones_${var.environment}_${count.index + 1}"
    Environment = var.environment
    Type        = "privada"
  }
}

resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.notificaciones.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.notificaciones.id
  }
  tags = {
    Name        = "rt_publica_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "publica" {
  count          = length(aws_subnet.publica.*.id)
  subnet_id      = aws_subnet.publica[count.index].id
  route_table_id = aws_route_table.publica.id
}

resource "aws_security_group" "notificaciones" {
  name        = "sg_notificaciones_${var.environment}"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.notificaciones.id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Salida completa"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "sg_notificaciones_${var.environment}"
    Environment = var.environment
  }
}