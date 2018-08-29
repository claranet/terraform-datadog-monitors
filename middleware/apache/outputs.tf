output "datadog_apache_process_id" {
  description = "id for monitor datadog_apache_process"
  value       = "${datadog_monitor.datadog_apache_process.*.id}"
}
