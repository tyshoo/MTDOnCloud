variable "environment" {
  type = string
  description = "Deployment Environment"
  default = "poc"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public subnet CIDRs"
  default = ["10.0.1.0/24, "10.0.2.0/24", "10.0.3.0/24"]
}
            
variable "private_subnet_cidrs" {
  type = list(string)
  description = "Private subnet CIDRs"
  default = ["10.0.11.0/24, "10.0.12.0/24", "10.0.13.0/24"]
}

variable "app_container_port" {
  type = number
  description = "Container listen port"
  default = 8080
}
            
variable "desired_count" {
  type = number
  description = "ECS desired task count"
  default = 2
}
