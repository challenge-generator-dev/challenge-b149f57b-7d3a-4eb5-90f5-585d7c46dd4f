# Módulo de compute para el servicio de notificaciones
# Superficie de práctica: el estudiante definirá los recursos de cómputo

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "notificaciones" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  user_data     = base64encode(templatefile("${path.module}/user_data.sh", {
    environment = var.environment
  }))
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name        = "ec2_notificaciones_${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_ecs_cluster" "notificaciones" {
  name = "cluster_notificaciones_${var.environment}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name        = "cluster_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_ecs_task_definition" "notificaciones" {
  family                   = "notificaciones_${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name      = "notificaciones"
    image     = "${var.ecr_repository_url}:${var.image_tag}"
    essential = true
    portMappings = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]
    environment = [
      {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/notificaciones_${var.environment}"
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
  tags = {
    Name        = "task_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role_notificaciones_${var.environment}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role_notificaciones_${var.environment}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_lb" "notificaciones" {
  name               = "alb_notificaciones_${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids
  enable_deletion_protection = false
  tags = {
    Name        = "alb_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "notificaciones" {
  name     = "tg_notificaciones_${var.environment}"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  tags = {
    Name        = "tg_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "notificaciones" {
  load_balancer_arn = aws_lb.notificaciones.arn
  port              = var.container_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notificaciones.arn
  }
}