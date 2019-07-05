output "API_Gateway_latency_id" {
  description = "id for monitor API_Gateway_latency"
  value       = datadog_monitor.API_Gateway_latency.*.id
}

output "API_http_5xx_errors_count_id" {
  description = "id for monitor API_http_5xx_errors_count"
  value       = datadog_monitor.API_http_5xx_errors_count.*.id
}

output "API_http_4xx_errors_count_id" {
  description = "id for monitor API_http_4xx_errors_count"
  value       = datadog_monitor.API_http_4xx_errors_count.*.id
}

