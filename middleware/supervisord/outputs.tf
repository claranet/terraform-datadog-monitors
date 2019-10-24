output "datadog_supervisord_process_id" {
  description = "id for monitor datadog_supervisord_process"
  value       = datadog_monitor.datadog_supervisord_process.*.id
}

