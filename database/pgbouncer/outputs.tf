output "pgbouncer_availability_id" {
  description = "id for monitor pgbouncer_availability"
  value       = datadog_monitor.pgbouncer_availability.*.id
}

output "pgbouncer_database_connection_limit_id" {
  description = "id for monitor pgbouncer_database_connection_limit"
  value       = datadog_monitor.pgbouncer_database_connection_limit.*.id
}

output "pgbouncer_pool_connection_limit_id" {
  description = "id for monitor pgbouncer_pool_connection_limit"
  value       = datadog_monitor.pgbouncer_pool_connection_limit.*.id
}

output "pgbouncer_wait_time_id" {
  description = "id for monitor pgbouncer_wait_time"
  value       = datadog_monitor.pgbouncer_wait_time.*.id
}

