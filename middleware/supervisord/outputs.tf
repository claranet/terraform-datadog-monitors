output "supervisord_status_id" {
  description = "id for monitor supervisord_status"
  value       = datadog_monitor.supervisord_status.*.id
}

