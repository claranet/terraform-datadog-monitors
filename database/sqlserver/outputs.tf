output "sqlserver_availability_id" {
  description = "id for monitor sqlserver_availability"
  value       = datadog_monitor.sqlserver_availability.*.id
}
