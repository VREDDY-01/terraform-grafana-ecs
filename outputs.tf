output "load_balancer" {
  description = "The dns of the load balancer"
  value       = "http://${module.load_balancer.lb_dns}"
}

