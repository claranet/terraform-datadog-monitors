output "cannot_connect_id" {
  description = "id for monitor cannot_connect"
  value       = datadog_monitor.cannot_connect.*.id
}

