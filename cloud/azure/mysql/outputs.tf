output "mysql_cpu_usage_id" {
  description = "id for monitor mysql_cpu_usage"
  value       = "${datadog_monitor.mysql_cpu_usage.*.id}"
}

output "mysql_no_connection_id" {
  description = "id for monitor mysql_no_connection"
  value       = "${datadog_monitor.mysql_no_connection.*.id}"
}

output "mysql_free_storage_id" {
  description = "id for monitor mysql_free_storage"
  value       = "${datadog_monitor.mysql_free_storage.*.id}"
}

output "mysql_io_consumption_id" {
  description = "id for monitor mysql_io_consumption"
  value       = "${datadog_monitor.mysql_io_consumption.*.id}"
}

output "mysql_compute_consumption_id" {
  description = "id for monitor mysql_compute_consumption"
  value       = "${datadog_monitor.mysql_compute_consumption.*.id}"
}

output "mysql_memory_usage_id" {
  description = "id for monitor mysql_memory_usage"
  value       = "${datadog_monitor.mysql_memory_usage.*.id}"
}
