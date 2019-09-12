output "service_cpu_utilization_id" {
  description = "id for monitor service_cpu_utilization"
  value       = datadog_monitor.service_cpu_utilization.*.id
}

output "service_memory_utilization_id" {
  description = "id for monitor service_memory_utilization"
  value       = datadog_monitor.service_memory_utilization.*.id
}

output "service_missing_tasks_id" {
  description = "id for monitor service_missing_tasks"
  value       = datadog_monitor.service_missing_tasks.*.id
}

