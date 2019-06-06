output "sending_operations_count_id" {
  description = "id for monitor sending_operations_count"
  value       = datadog_monitor.sending_operations_count.*.id
}

output "unavailable_sending_operations_count_id" {
  description = "id for monitor unavailable_sending_operations_count"
  value       = datadog_monitor.unavailable_sending_operations_count.*.id
}

