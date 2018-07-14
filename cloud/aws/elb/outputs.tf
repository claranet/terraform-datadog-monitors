output "ELB_no_healthy_instances_id" {
  description = "id for monitor ELB_no_healthy_instances"
  value       = "${datadog_monitor.ELB_no_healthy_instances.id}"
}

output "ELB_too_much_4xx_id" {
  description = "id for monitor ELB_too_much_4xx"
  value       = "${datadog_monitor.ELB_too_much_4xx.id}"
}

output "ELB_too_much_5xx_id" {
  description = "id for monitor ELB_too_much_5xx"
  value       = "${datadog_monitor.ELB_too_much_5xx.id}"
}

output "ELB_too_much_4xx_backend_id" {
  description = "id for monitor ELB_too_much_4xx_backend"
  value       = "${datadog_monitor.ELB_too_much_4xx_backend.id}"
}

output "ELB_too_much_5xx_backend_id" {
  description = "id for monitor ELB_too_much_5xx_backend"
  value       = "${datadog_monitor.ELB_too_much_5xx_backend.id}"
}

output "ELB_backend_latency_id" {
  description = "id for monitor ELB_backend_latency"
  value       = "${datadog_monitor.ELB_backend_latency.id}"
}
