output "error_rate_4xx_id" {
  description = "id for monitor error_rate_4xx"
  value       = datadog_monitor.error_rate_4xx.*.id
}

output "error_rate_5xx_id" {
  description = "id for monitor error_rate_5xx"
  value       = datadog_monitor.error_rate_5xx.*.id
}

output "backend_latency_service_id" {
  description = "id for monitor backend_latency_service"
  value       = datadog_monitor.backend_latency_service.*.id
}

output "backend_latency_bucket_id" {
  description = "id for monitor backend_latency_bucket"
  value       = datadog_monitor.backend_latency_bucket.*.id
}

output "request_count_id" {
  description = "id for monitor request_count"
  value       = datadog_monitor.request_count.*.id
}

