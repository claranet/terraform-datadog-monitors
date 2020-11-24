output "notification_failure_id" {
  description = "id for monitor notification_failure"
  value       = datadog_monitor.notification_failure.*.id
}

