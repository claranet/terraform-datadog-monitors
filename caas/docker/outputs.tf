output "memory_used_id" {
  description = "id for monitor memory_used"
  value       = datadog_monitor.memory_used.*.id
}

output "not_responding_id" {
  description = "id for monitor not_responding"
  value       = datadog_monitor.not_responding.*.id
}

