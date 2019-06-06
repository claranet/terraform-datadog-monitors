output "ark_schedules_monitor_id" {
  description = "id for monitor ark_schedules_monitor"
  value       = datadog_monitor.ark_schedules_monitor.*.id
}

