output "error_id" {
  description = "id for monitor error"
  value       = datadog_monitor.error.*.id
}

output "pod_phase_status_id" {
  description = "id for monitor pod_phase_status"
  value       = datadog_monitor.pod_phase_status.*.id
}

output "terminated_id" {
  description = "id for monitor terminated"
  value       = datadog_monitor.terminated.*.id
}

