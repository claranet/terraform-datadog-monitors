output "servicebus_status_id" {
  description = "id for monitor servicebus_status"
  value       = "${datadog_monitor.servicebus_status.*.id}"
}
