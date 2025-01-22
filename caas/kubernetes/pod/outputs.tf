output "error_id" {
  description = "id for monitor error"
  value       = datadog_monitor.error.*.id
}

output "pod_container_killed_by_oom_id" {
  description = "id for monitor pod_container_killed_by_oom"
  value       = datadog_monitor.pod_container_killed_by_oom.*.id
}

output "pod_frequently_restarted_id" {
  description = "id for monitor pod_frequently_restarted"
  value       = datadog_monitor.pod_frequently_restarted.*.id
}

output "pod_phase_status_id" {
  description = "id for monitor pod_phase_status"
  value       = datadog_monitor.pod_phase_status.*.id
}

output "terminated_id" {
  description = "id for monitor terminated"
  value       = datadog_monitor.terminated.*.id
}

