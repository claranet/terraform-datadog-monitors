output "appgateway_backend_connect_time_id" {
  description = "id for monitor appgateway_backend_connect_time"
  value       = datadog_monitor.appgateway_backend_connect_time.*.id
}

output "appgateway_backend_http_4xx_errors_id" {
  description = "id for monitor appgateway_backend_http_4xx_errors"
  value       = datadog_monitor.appgateway_backend_http_4xx_errors.*.id
}

output "appgateway_backend_http_5xx_errors_id" {
  description = "id for monitor appgateway_backend_http_5xx_errors"
  value       = datadog_monitor.appgateway_backend_http_5xx_errors.*.id
}

output "appgateway_failed_requests_id" {
  description = "id for monitor appgateway_failed_requests"
  value       = datadog_monitor.appgateway_failed_requests.*.id
}

output "appgateway_healthy_host_count_id" {
  description = "id for monitor appgateway_healthy_host_count"
  value       = datadog_monitor.appgateway_healthy_host_count.*.id
}

output "appgateway_http_4xx_errors_id" {
  description = "id for monitor appgateway_http_4xx_errors"
  value       = datadog_monitor.appgateway_http_4xx_errors.*.id
}

output "appgateway_http_5xx_errors_id" {
  description = "id for monitor appgateway_http_5xx_errors"
  value       = datadog_monitor.appgateway_http_5xx_errors.*.id
}

output "appgateway_status_id" {
  description = "id for monitor appgateway_status"
  value       = datadog_monitor.appgateway_status.*.id
}

output "current_connection_id" {
  description = "id for monitor current_connection"
  value       = datadog_monitor.current_connection.*.id
}

