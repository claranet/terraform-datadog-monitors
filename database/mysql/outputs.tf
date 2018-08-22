output "mysql_connection_too_high_id" {
  description = "id for monitor mysql_connection_too_high"
  value       = "${datadog_monitor.mysql_connection_too_high.id}"
}

output "mysql_thread_too_high_id" {
  description = "id for monitor mysql_thread_too_high"
  value       = "${datadog_monitor.mysql_thread_too_high.id}"
}
