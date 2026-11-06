environment_name         = "dev"
environment_short        = "d"
aws_region               = "us-east-1"

vpc_cidr_block           = "10.0.0.0/16"
public_subnets_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidrs    = ["10.0.11.0/24", "10.0.12.0/24"]

instance_type            = "t3.medium"
instance_count           = 2
ami_id                   = "ami-0c55b159cbfafe1f0"

enable_public_ip         = true
root_volume_size         = 30
root_volume_type         = "gp3"

allowed_ssh_cidr         = ["10.0.0.0/16"]
allowed_http_cidr        = ["0.0.0.0/0"]
allowed_https_cidr       = ["0.0.0.0/0"]
allowed_smtp_cidr        = ["10.0.0.0/16"]

tags = {
  Environment     = "development"
  Project         = "notificaciones"
  ManagedBy       = "terraform"
  CostCenter      = "engineering"
  Owner           = "devops-team"
}