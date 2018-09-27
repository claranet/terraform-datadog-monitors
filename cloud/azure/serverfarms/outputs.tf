output "status_id" {
  description = "id for monitor status"
  value       = "${datadog_monitor.status.*.id}"
}

output "cpu_percentage_id" {
  description = "id for monitor cpu_percentage"
  value       = "${datadog_monitor.cpu_percentage.*.id}"
}

output "memory_percentage_id" {
  description = "id for monitor memory_percentage"
  value       = "${datadog_monitor.memory_percentage.*.id}"
}

