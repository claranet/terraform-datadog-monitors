output "datadog_supervisord_process_id" {
  description = "id for monitor datadog_supervisord_process"
  value       = datadog_monitor.datadog_supervisord_process.*.id
}

output "datadog_supervisord_process_not_available_id" {
  description = "id for monitor datadog_supervisord_process_not_available"
  value       = datadog_monitor.datadog_supervisord_process_not_available.*.id
}

