module "vpc" {
  source              = "./modules/vpc"
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs= var.private_subnet_cidrs
}

resource "aws_ecr_repository" "mtd" {
  name                 = "${var.environment}-mtd"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }
}

module "ecs" {
  source           = "./modules/ecs"
  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  private_subnets  = module.vpc.private_subnets
  container_image  = aws_ecr_repository.mtd.repository_url
  container_port   = var.app_container_port
  desired_count    = var.desired_count
}

module "security" {
  source      = "./modules/security"
  environment = var.environment
}

module "observability" {
  source      = "./modules/observability"
  environment = var.environment
}
