environment_name         = "prod"
environment_short        = "p"
aws_region               = "us-east-1"

vpc_cidr_block           = "10.1.0.0/16"
public_subnets_cidrs     = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets_cidrs    = ["10.1.11.0/24", "10.1.12.0/24"]

instance_type            = "t3.large"
instance_count           = 3
ami_id                   = "ami-0c55b159cbfafe1f0"

enable_public_ip         = false
root_volume_size         = 100
root_volume_type         = "gp3"

allowed_ssh_cidr         = ["10.1.0.0/16"]
allowed_http_cidr        = ["10.1.0.0/16"]
allowed_https_cidr       = ["10.1.0.0/16"]
allowed_smtp_cidr        = ["10.1.0.0/16"]

tags = {
  Environment     = "production"
  Project         = "notificaciones"
  ManagedBy       = "terraform"
  CostCenter      = "engineering"
  Owner           = "devops-team"
  Compliance      = "pci-dss"
  BackupRequired  = "true"
}