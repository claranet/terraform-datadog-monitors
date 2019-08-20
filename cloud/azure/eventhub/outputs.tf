output "eventhub_errors_id" {
  description = "id for monitor eventhub_errors"
  value       = datadog_monitor.eventhub_errors.*.id
}

output "eventhub_failed_requests_id" {
  description = "id for monitor eventhub_failed_requests"
  value       = datadog_monitor.eventhub_failed_requests.*.id
}

output "eventhub_status_id" {
  description = "id for monitor eventhub_status"
  value       = datadog_monitor.eventhub_status.*.id
}

