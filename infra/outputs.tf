output "alb_endpoint" {
  description = "Application Load Balancer DNS"
  value       = module.ecs.alb_dns
}

output "cost_dashboard" {
  description = "CloudWatch Dashboard name"
  value       = module.observability.dashboard_name
}
