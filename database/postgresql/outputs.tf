output "postgresql_availability_id" {
  description = "id for monitor postgresql_availability"
  value       = datadog_monitor.postgresql_availability.*.id
}

output "postgresql_connection_too_high_id" {
  description = "id for monitor postgresql_connection_too_high"
  value       = datadog_monitor.postgresql_connection_too_high.*.id
}

output "postgresql_disk_queue_depth_id" {
  description = "id for monitor postgresql_disk_queue_depth"
  value       = datadog_monitor.postgresql_disk_queue_depth.*.id
}

output "postgresql_too_many_locks_id" {
  description = "id for monitor postgresql_too_many_locks"
  value       = datadog_monitor.postgresql_too_many_locks.*.id
}

