output "status_monitor_id" {
  value = "${datadog_monitor.eventhub_failed_requests.id}"
}

output "failed_requests_monitor_id" {
  value = "${datadog_monitor.eventhub_status.id}"
}

output "errors_monitor_id" {
  value = "${datadog_monitor.eventhub_errors.id}"
}
