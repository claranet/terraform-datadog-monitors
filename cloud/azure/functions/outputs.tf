output "function_http_5xx_errors_rate_id" {
  description = "id for monitor function_http_5xx_errors_rate"
  value       = "${datadog_monitor.function_http_5xx_errors_rate.*.id}"
}

output "function_high_connections_count_id" {
  description = "id for monitor function_high_connections_count"
  value       = "${datadog_monitor.function_high_connections_count.*.id}"
}

output "function_high_threads_count_id" {
  description = "id for monitor function_high_threads_count"
  value       = "${datadog_monitor.function_high_threads_count.*.id}"
}
