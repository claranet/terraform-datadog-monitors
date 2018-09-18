output "postgresql_connection_too_high_id" {
  description = "id for monitor postgresql_connection_too_high"
  value       = "${datadog_monitor.postgresql_connection_too_high.*.id}"
}

output "postgresql_too_many_locks_id" {
  description = "id for monitor postgresql_too_many_locks"
  value       = "${datadog_monitor.postgresql_too_many_locks.*.id}"
}
