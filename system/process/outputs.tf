output "datadog_process_check_id" {
  description = "id for monitor datadog_process_check"
  value       = "${datadog_monitor.datadog_process_check.*.id}"
}
