output "datadog_php_fpm_connect_idle_id" {
  description = "id for monitor datadog_php_fpm_connect_idle"
  value       = "${datadog_monitor.datadog_php_fpm_connect_idle.id}"
}

output "datadog_fpm_process_id" {
  description = "id for monitor datadog_fpm_process"
  value       = "${datadog_monitor.datadog_fpm_process.id}"
}
