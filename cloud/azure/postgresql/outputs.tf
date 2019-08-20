output "postgresql_cpu_usage_id" {
  description = "id for monitor postgresql_cpu_usage"
  value       = datadog_monitor.postgresql_cpu_usage.*.id
}

output "postgresql_free_storage_id" {
  description = "id for monitor postgresql_free_storage"
  value       = datadog_monitor.postgresql_free_storage.*.id
}

output "postgresql_io_consumption_id" {
  description = "id for monitor postgresql_io_consumption"
  value       = datadog_monitor.postgresql_io_consumption.*.id
}

output "postgresql_memory_usage_id" {
  description = "id for monitor postgresql_memory_usage"
  value       = datadog_monitor.postgresql_memory_usage.*.id
}

output "postgresql_no_connection_id" {
  description = "id for monitor postgresql_no_connection"
  value       = datadog_monitor.postgresql_no_connection.*.id
}

