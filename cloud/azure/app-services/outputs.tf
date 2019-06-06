output "appservices_response_time_id" {
  description = "id for monitor appservices_response_time"
  value       = datadog_monitor.appservices_response_time.*.id
}

output "appservices_memory_usage_count_id" {
  description = "id for monitor appservices_memory_usage_count"
  value       = datadog_monitor.appservices_memory_usage_count.*.id
}

output "appservices_http_5xx_errors_count_id" {
  description = "id for monitor appservices_http_5xx_errors_count"
  value       = datadog_monitor.appservices_http_5xx_errors_count.*.id
}

output "appservices_http_4xx_errors_count_id" {
  description = "id for monitor appservices_http_4xx_errors_count"
  value       = datadog_monitor.appservices_http_4xx_errors_count.*.id
}

output "appservices_http_success_status_rate_id" {
  description = "id for monitor appservices_http_success_status_rate"
  value       = datadog_monitor.appservices_http_success_status_rate.*.id
}

output "appservices_status_id" {
  description = "id for monitor appservices_status"
  value       = datadog_monitor.appservices_status.*.id
}

