output "servicebus_status_id" {
  description = "id for monitor servicebus_status"
  value       = "${datadog_monitor.servicebus_status.*.id}"
}

output "service_bus_no_active_connections_id" {
  description = "id for monitor service_bus_no_active_connections"
  value       = "${datadog_monitor.service_bus_no_active_connections.id}"
}

output "service_bus_user_errors_id" {
  description = "id for monitor service_bus_user_errors"
  value       = "${datadog_monitor.service_bus_user_errors.id}"
}

output "service_bus_server_errors_id" {
  description = "id for monitor service_bus_server_errors"
  value       = "${datadog_monitor.service_bus_server_errors.id}"
}
