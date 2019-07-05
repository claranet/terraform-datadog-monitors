output "datadog_nginx_process_id" {
  description = "id for monitor datadog_nginx_process"
  value       = datadog_monitor.datadog_nginx_process.*.id
}

output "datadog_nginx_dropped_connections_id" {
  description = "id for monitor datadog_nginx_dropped_connections"
  value       = datadog_monitor.datadog_nginx_dropped_connections.*.id
}

