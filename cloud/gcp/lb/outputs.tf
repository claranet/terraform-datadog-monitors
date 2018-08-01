output "error_rate_4xx_id" {
  description = "id for monitor error_rate_4xx"
  value       = "${datadog_monitor.error_rate_4xx.id}"
}

output "error_rate_5xx_id" {
  description = "id for monitor error_rate_5xx"
  value       = "${datadog_monitor.error_rate_5xx.id}"
}

output "latency_id" {
  description = "id for monitor latency"
  value       = "${datadog_monitor.latency.id}"
}

output "backend_latency_id" {
  description = "id for monitor backend_latency"
  value       = "${datadog_monitor.backend_latency.id}"
}

output "request_count_id" {
  description = "id for monitor request_count"
  value       = "${datadog_monitor.request_count.id}"
}
