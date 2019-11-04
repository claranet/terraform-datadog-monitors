output "application_5xx_error_rate_id" {
  description = "id for monitor application_5xx_error_rate"
  value       = datadog_monitor.application_5xx_error_rate.*.id
}

output "application_latency_p90_id" {
  description = "id for monitor application_latency_p90"
  value       = datadog_monitor.application_latency_p90.*.id
}

output "health_id" {
  description = "id for monitor health"
  value       = datadog_monitor.health.*.id
}

output "root_filesystem_usage_id" {
  description = "id for monitor root_filesystem_usage"
  value       = datadog_monitor.root_filesystem_usage.*.id
}

