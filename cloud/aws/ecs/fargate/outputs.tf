output "cpu_utilization_id" {
  description = "id for monitor cpu_utilization"
  value       = datadog_monitor.cpu_utilization.*.id
}

output "memory_utilization_id" {
  description = "id for monitor memory_utilization"
  value       = datadog_monitor.memory_utilization.*.id
}

output "service_check_id" {
  description = "id for monitor service_check"
  value       = datadog_monitor.service_check.*.id
}

