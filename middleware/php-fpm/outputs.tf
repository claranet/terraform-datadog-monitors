output "php_fpm_connect_id" {
  description = "id for monitor php_fpm_connect"
  value       = datadog_monitor.php_fpm_connect.*.id
}

output "php_fpm_connect_idle_id" {
  description = "id for monitor php_fpm_connect_idle"
  value       = datadog_monitor.php_fpm_connect_idle.*.id
}

